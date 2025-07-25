class_name Interactable
extends Area2D
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var interact_sprite: Sprite2D
@export var lines: Array[String]
@export var textColor: Color

func _ready() -> void:
	collision.shape = RectangleShape2D.new()


func in_range():
	interact_sprite.global_position = global_position + Vector2(0, -24)
	interact_sprite.visible = true
	


func interact(interactor):
	print("Interacted!")
