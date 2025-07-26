class_name ProximityActivate
extends ActiveContainer
@onready var area: Area2D = $Area2D


func _ready() -> void:
	area.body_entered.connect(_on_area_2d_body_entered)
	area.body_exited.connect(_on_body_exited)


func activate(trigger):
	for child in children:
		child.activate(null)


func _on_area_2d_body_entered(body: Node2D) -> void:
	activate(body)

func _on_body_exited(body: Node2D) -> void:
	activate(body)
