class_name UnstablePlatform
extends Activateable

@onready var animation_player: AnimationPlayer = $DeathZone/AnimationPlayer
@onready var sprite: AnimatedSprite2D = $Sprite

@export var next: Activateable
@export var reset_pos: Vector2
@export var prev: Activateable

var playing = false

func activate(trigger):
	playing = true
	sprite.play("retract_platform")
	animation_player.play("retract_floor")


func reset():
	playing = false
	sprite.stop()
	animation_player.play("RESET")
	if prev:
		prev.reset()


func _on_death_zone_body_entered(body: Node2D) -> void:
	body.kill(reset_pos)
	if not prev:
		return
	if next is UnstablePlatform and next.playing:
		next.reset()
	reset()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "retract_floor":
		if next:
			next.activate(self)
