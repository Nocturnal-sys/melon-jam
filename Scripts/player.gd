extends CharacterBody2D

const TILE: Vector2 = Vector2(16,16)

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var up: RayCast2D = $Up
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right

var sprite_tween: Tween
enum PrevDirection{
	UP,
	DOWN,
	LEFT,
	RIGHT
} 
var prev_step: PrevDirection


func _physics_process(delta: float) -> void:
	if !sprite_tween or !sprite_tween.is_running():
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


func _move(direction: Vector2):
	global_position += direction * TILE
	sprite.global_position -= direction * TILE


	if sprite_tween:
		sprite_tween.kill()
	sprite_tween = create_tween()
	sprite_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_tween.tween_property(sprite,"global_position", global_position, 0.62).set_trans(Tween.TRANS_SINE)


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "move_left":
		print("end")
