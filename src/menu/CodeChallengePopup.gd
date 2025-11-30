extends CanvasLayer

signal answered(correct)
signal quiz_completed()

export(Array) var answers = []
export(int) var correct_index = -1
export(float) var result_display_time = 2.5  # Seconds to show result before hiding

onready var question_label = $Panel/VBoxContainer/QuestionLabel
onready var answers_container = $Panel/VBoxContainer/AnswersContainer
onready var submit_button = $Panel/VBoxContainer/SubmitButton

var selected_index = -1
var current_question_num = 1
var awaiting_next_question = false
var result_timer: Timer

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	submit_button.connect("pressed", self, "_on_submit_pressed")
	
	# Create a timer for auto-hiding after showing results
	result_timer = Timer.new()
	result_timer.one_shot = true
	result_timer.connect("timeout", self, "_on_result_timer_timeout")
	add_child(result_timer)
	
	# Don't show immediately, wait to be triggered
	# To start the quiz, call load_question(1) from your game code

func load_question(question_num):
	awaiting_next_question = false
	current_question_num = question_num
	
	# Define all your questions here based on the number
	show_question(
		"Test Question 1?",
		["Option A", "Option B", "Option C", "Option D"],
		1
	)

func show_question(question_text, answer_list, correct):
	# Set question
	question_label.text = question_text
	
	# Clear previous answers
	for c in answers_container.get_children():
		c.queue_free()
	
	# Save new data
	answers = answer_list
	correct_index = correct
	selected_index = 0  # Start with first option selected
	
	# Make sure submit button is visible for new question
	submit_button.visible = false
	
	# Build answer buttons
	for i in range(answers.size()):
		var btn = preload("res://src/menu/Answerbutton.tscn").instance()
		btn.text = answers[i]
		answers_container.add_child(btn)
	
	# Highlight the first option
	_update_visual_selection()
	show()

func _input(event):
	if not visible:
		return
	
	# Make sure we only process key PRESS events, not held keys
	if not event is InputEventKey:
		return
	
	if not event.pressed or event.echo:
		return
	
	# If waiting for next question, space advances (but timer will also auto-advance)
	if awaiting_next_question:
		if event.is_action_pressed("ui_accept") or event.scancode == KEY_SPACE:
			result_timer.stop()  # Cancel auto-hide if they press space
			_advance_to_next_question()
			get_tree().set_input_as_handled()
		return
	
	# Arrow key navigation
	if event.is_action_pressed("ui_up"):
		selected_index = max(0, selected_index - 1)
		_update_visual_selection()
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_down"):
		selected_index = min(answers.size() - 1, selected_index + 1)
		_update_visual_selection()
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_left"):
		selected_index = max(0, selected_index - 1)
		_update_visual_selection()
		get_tree().set_input_as_handled()
	elif event.is_action_pressed("ui_right"):
		selected_index = min(answers.size() - 1, selected_index + 1)
		_update_visual_selection()
		get_tree().set_input_as_handled()
	# Space to submit
	elif event.is_action_pressed("ui_accept") or event.scancode == KEY_SPACE:
		_on_submit_pressed()
		get_tree().set_input_as_handled()

func _update_visual_selection():
	# Visually show the selected button
	var children = answers_container.get_children()
	for i in range(children.size()):
		if i == selected_index:
			children[i].modulate = Color(0.7, 1, 0.7)  # highlighted
		else:
			children[i].modulate = Color(1, 1, 1)  # normal

func _on_submit_pressed():
	if selected_index == -1:
		return
	
	var is_correct = (selected_index == correct_index)
	
	# Hide the answer buttons during result display
	for c in answers_container.get_children():
		c.visible = false
	
	# Hide submit button too
	submit_button.visible = false
	
	if is_correct:
		question_label.text = "Correct! 🎉"
		emit_signal("answered", true)
	else:
		question_label.text = "Wrong!\nCorrect: " + answers[correct_index]
		emit_signal("answered", false)
	
	# Set flag and start timer for auto-advance
	awaiting_next_question = true
	result_timer.start(result_display_time)

func _on_result_timer_timeout():
	_advance_to_next_question()

func _advance_to_next_question():
	# Check if there are more questions
	# For now, just complete the quiz and hide
	emit_signal("quiz_completed")
	hide_on_level_select()

func hide_on_level_select():
	if Shared.is_level_select:
		visible = false
	hide()
