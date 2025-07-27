extends Node2D

@onready var generator_room_light: PointLight2D = $WorldObjects/GeneratorRoom/PointLight2D
@onready var global_light: DirectionalLight2D = $DirectionalLight2D

var generators = 0
var point_light_tween: Tween
var global_light_tween: Tween

func update_power():
	generators += 1
	if generators == 2:
		print("powered up!")
		turn_on_lights()


func turn_on_lights():
	print("turn on the lights!!")
	point_light_tween = create_tween()
	point_light_tween.tween_property(generator_room_light,"energy",0,0.8)
	await point_light_tween.finished
	global_light_tween = create_tween()
	global_light_tween.tween_property(global_light, "energy",0,1.4)


func _on_power_computer_power_up() -> void:
	update_power()
