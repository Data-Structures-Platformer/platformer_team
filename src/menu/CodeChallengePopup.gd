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
	selected_index = -1

	# Build answer buttons
	for i in range(answers.size()):
		var btn = preload("res://src/menu/Answerbutton.tscn").instance()
		btn.text = answers[i]
		btn.connect("pressed", self, "_on_answer_pressed", [i, btn])
		answers_container.add_child(btn)

	show()

func _on_answer_pressed(index, btn):
	selected_index = index
	
	# Visually show the selected button
	for c in answers_container.get_children():
		c.modulate = Color(1,1,1)
	btn.modulate = Color(0.7,1,0.7)  # highlight-ish

func _on_submit_pressed():
	if selected_index == -1:
		question_label.text = "Please choose an answer."
		return

	if selected_index == correct_index:
		question_label.text = "Correct! 🎉"
		yield(get_tree().create_timer(1.0), "timeout")
		hide()
		get_tree().paused = false
	else:
		question_label.text = "Incorrect. Try again!"
		emit_signal("answered", false)
