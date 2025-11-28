extends CanvasLayer
signal answered(correct)
export(Array) var answers = []
export(int) var correct_index = -1
onready var question_label = $Panel/VBoxContainer/QuestionLabel
onready var answers_container = $Panel/VBoxContainer/AnswersContainer
onready var submit_button = $Panel/VBoxContainer/SubmitButton
var selected_index = -1

func _ready():
	# hide()
	pause_mode = Node.PAUSE_MODE_PROCESS
	submit_button.connect("pressed", self, "_on_submit_pressed")
	show_question(
	"Test Question?",
	["Option A", "Option B", "Option C"],
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
	
	if not event.pressed or event.echo:  # ADD THIS LINE - ignore held/repeated keys
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
		question_label.text = "Please choose an answer."
		return
	
	if selected_index == correct_index:
		question_label.text = "Correct! 🎉"
		emit_signal("answered", true)  # Emit signal BEFORE hiding
		yield(get_tree().create_timer(1.0), "timeout")
		hide()
		get_tree().paused = false
		# If you need to return to level select, add:
		# get_tree().change_scene("res://path/to/level_select.tscn")
	else:
		question_label.text = "Incorrect. Try again!"
		emit_signal("answered", false)
