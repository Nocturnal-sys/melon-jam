class_name Player
extends CharacterBody2D

const TILE: Vector2 = Vector2(16,16)

@onready var light: PointLight2D = $AnimatedSprite2D/PointLight2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var up: RayCast2D = $Up
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right
@onready var up_interact: RayCast2D = $UpInteract
@onready var down_interact: RayCast2D = $DownInteract
@onready var left_interact: RayCast2D = $LeftInteract
@onready var right_interact: RayCast2D = $RightInteract
@onready var interaction_sprite: Sprite2D = $InteractionPrompt/Path2D/PathFollow2D/Sprite2D
@onready var path: PathFollow2D = $InteractionPrompt/Path2D/PathFollow2D

@export var interactions: Array[RayCast2D]
@export var text_box: TextBox
@export var text_box_active: bool = false

var speed_factor: float = 0.9

enum PrevDirection{
	DOWN,
	UP,
	LEFT,
	RIGHT
} 
var sprite_tween: Tween
var prev_step: PrevDirection
var tween_running: bool = false

var interactable: Interactable

signal text_finished()

func _ready() -> void:
	PlayerManager.add_player(self)
	light.color = get_color()


func _physics_process(delta: float) -> void:
	_display_interaction()
	if sprite_tween and sprite_tween.is_running():
		tween_running = true
		return
	else:
		tween_running = false
	_handle_movement()

	if Input.is_action_just_pressed("interact"):
		_handle_interaction()

	if Input.is_action_just_pressed("change_color"):
		PlayerManager.cycle_color()


# deal with movement and play animations
func _handle_movement():
	
	if text_box_active:
		return
	
	if Input.is_action_pressed("move_up") and !up.is_colliding():
		sprite.play("move_up")
		_move(Vector2(0, -1))
		prev_step = PrevDirection.UP
	elif Input.is_action_pressed("move_down") and !down.is_colliding():
		sprite.play("move_down")
		_move(Vector2(0, 1))
		prev_step = PrevDirection.DOWN
	elif Input.is_action_pressed("move_left") and !left.is_colliding():
		sprite.play("move_left")
		_move(Vector2(-1, 0))
		prev_step = PrevDirection.LEFT
	elif Input.is_action_pressed("move_right") and !right.is_colliding():
		sprite.play("move_right")
		_move(Vector2(1, 0))
		prev_step = PrevDirection.RIGHT

	else:
		match prev_step:
			0:
				sprite.play("idle_down")
			1:
				sprite.play("idle_up")
			2:
				sprite.play("idle_left")
			3:
				sprite.play("idle_right")


# handles interactions when "interact" key pressed
func _handle_interaction() -> void:
	if text_box_active:
		return
	for ray in interactions:
		if interactable:
			interactable.interact(self)
			break


func _display_interaction():
	for ray in interactions:
		if !ray.is_colliding():
			interactable = null
			interaction_sprite.hide()
		elif ray.get_collider() is Interactable:
			interactable = ray.get_collider()
			break
	if interactable:
		interaction_sprite.global_position = interactable.global_position + Vector2(0, -24)
		interaction_sprite.show()


func _move(direction: Vector2):

	global_position += direction * TILE
	sprite.global_position -= direction * TILE

	if sprite_tween:
		sprite_tween.kill()
	sprite_tween = create_tween()
	sprite_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_tween.tween_property(sprite,"global_position", global_position, 0.4 / speed_factor).set_trans(Tween.TRANS_SINE)


func change_color(color: Color):
	sprite.modulate = color
	light.color = color
	if color == Color(0.0,0.8,0.6,0.8):
		speed_factor = 3.5
	elif color == Color(1,1,0.4,0.8):
		increase_light_power()
	else:
		speed_factor = 0.9
		decrease_light_power()


func increase_light_power():
	light.texture_scale = 6
	light.energy = 2


func decrease_light_power():
	light.texture_scale = 1
	light.energy = 0.5


func get_color():
	return sprite.modulate


func _on_text_box_finished() -> void:
	text_box_active = false
	text_finished.emit(interactable)


func kill(pos: Vector2):
	if tween_running:
		await sprite_tween.finished
	global_position = pos
