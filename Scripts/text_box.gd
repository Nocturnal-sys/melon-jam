class_name TextBox
extends MarginContainer

@onready var next_line: Label = $MarginContainer/HBoxContainer/NextLine
@onready var text: Label = $MarginContainer/HBoxContainer/Text

const CHAR_READ_RATE = 0.05

var dialogueLines: Array[String]
var line_index: int
var typing_tween: Tween
var continue_dialogue: bool = false

enum State{
	READY,
	READING,
	LINE_FINISHED,
	FINISHED
}

var current_state = State.READY

signal finished()


func _ready() -> void:
	_change_state(State.READY)
	print("starting state: READY")
	hide_text_box()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		match current_state:
			State.READING:
				text.visible_ratio = 1
			State.LINE_FINISHED:
				add_line(_format_line(dialogueLines[line_index]))
			State.FINISHED:
				hide_text_box()
				finished.emit()
	pass


# if there are lines to display,shows the text box and displays them
func show_text_box():
	_change_state(State.READY)
	line_index = 0
	if len(dialogueLines) > 0:
		add_line(_format_line(dialogueLines[line_index]))
		show()
		current_state = State.READY


# resets and hides the text box
func hide_text_box():
	next_line.text = ""
	text.text = ""
	hide()


#adds new line characters to string for proper display of text
func _format_line(line: String):
	var lineArray = line.split("|")
	var outputLine: String
	for i in len(lineArray):
		if i == len(lineArray)-1:
			outputLine += lineArray[i]
		else:
			outputLine += lineArray[i] + "\n"
	return outputLine


# adds a line to the text box and displays it using a tween
func add_line(line: String):
	text.visible_ratio = 0
	next_line.text = ""
	_change_state(State.READING)
	text.text = line
	typing_tween = create_tween()
	typing_tween.tween_property(text,"visible_ratio", 1, len(line)*CHAR_READ_RATE)
	await typing_tween.finished
	_change_state(State.LINE_FINISHED)
	next_line.text = "<"
	line_index += 1
	if line_index == len(dialogueLines):
		_change_state(State.FINISHED)


# changes displayed text color based on a provided color parameter
func change_text_color(color: Color):
	text.add_theme_color_override("font_color", color)
	next_line.add_theme_color_override("font_color", color)


# changes to a new state
func _change_state(next_state: State):
	current_state = next_state
	match current_state:
		State.READY:
			print("changing state to READY")
		State.READING:
			print("changing state to READING")
		State.LINE_FINISHED:
			print("changing state to LINE_FINISHED")
		State.FINISHED:
			print("changing state to FINISHED")
