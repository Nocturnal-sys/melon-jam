class_name Interactable
extends Area2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var sprite_image: CompressedTexture2D

func _ready() -> void:
	sprite.texture = sprite_image
	collision.shape = RectangleShape2D.new()
