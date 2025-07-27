extends Area2D

@export var lines: Array[String]
@export var text_color: Color

signal win_game()


func _on_body_entered(body: Player) -> void:
	if text_color:
		body.text_box.change_text_color(text_color)
	if lines:
		body.text_box_active = true
		body.text_box.dialogueLines = lines
		body.text_box.show_text_box()
		await body.text_finished
	win_game.emit()
