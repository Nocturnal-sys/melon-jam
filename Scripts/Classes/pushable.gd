class_name Pushable
extends Interactable

@export var denied_lines: Array[String]

@onready var up: RayCast2D = $Up
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right


var movement_tween: Tween
var direction: Vector2
var check_direction: Vector2
var new_position: Vector2

func interact(interactor):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if interactor.get_color() != Color(1,0.4,0,0.8):
		if !denied_lines:
			return
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = denied_lines
		interactor.text_box.show_text_box()
	else:
		if lines:
			interactor.text_box_active = true
			interactor.text_box.dialogueLines = lines
			interactor.text_box.show_text_box()
			await interactor.text_box.finished
		direction = (global_position - interactor.global_position).normalized()
		_move(direction)


func _move(direction: Vector2) -> void:
	print(direction)
	match direction:
		Vector2.UP:
			if up.is_colliding():
				return
		Vector2.DOWN:
			if down.is_colliding():
				return
		Vector2.LEFT:
			if left.is_colliding():
				return
		Vector2.RIGHT:
			if right.is_colliding():
				return
	new_position = global_position + direction * 16
	print(new_position)
	movement_tween = create_tween()
	movement_tween.tween_property(self,"global_position",new_position,0.2)
