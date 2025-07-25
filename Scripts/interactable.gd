class_name Interactable
extends Area2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	collision.shape = RectangleShape2D.new()


func interact(interactor):
	print("Interacted!")
