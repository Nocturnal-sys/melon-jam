extends Activateable
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var close_sound: AudioStreamPlayer2D = $Close
@onready var open_sound: AudioStreamPlayer2D = $Open

var open: bool = false


func activate(trigger):
	if sprite.is_playing():
		return
	if open:
		close_sound.play()
		sprite.play("door_close")
		animation.play("door_close")
		open = false
	else:
		open_sound.play()
		sprite.play("door_open")
		animation.play("door_open")
		open = true
