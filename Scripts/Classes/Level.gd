class_name Level
extends Node2D

@export var next : String


func reset_focus() -> void:
	pass


func next_level() -> void:
	LevelSwitcher.advance_level(next)
