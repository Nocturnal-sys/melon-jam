extends Activateable
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

var open: bool = false


func activate():
	if sprite.is_playing():
		return
	if open:
		sprite.play("door_close")
		animation.play("door_close")
		open = false
	else:
		sprite.play("door_open")
		animation.play("door_open")
		open = true
