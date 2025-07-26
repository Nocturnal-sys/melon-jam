class_name NotificationArea
extends ProximityActivate

@export var triggerable: Activateable
@export var lines: Array[String]
@export var text_color: Color

var played = false


func activate(trigger: Player):
	if played:
		return
	if text_color:
		trigger.text_box.change_text_color(text_color)
	if lines:
		trigger.text_box_active = true
		trigger.text_box.dialogueLines = lines
		trigger.text_box.show_text_box()
	await trigger.text_finished
	played = true
	if triggerable:
		triggerable.activate(trigger)


func reset():
	played = false


func _on_body_exited(body: Node2D) -> void:
	pass
