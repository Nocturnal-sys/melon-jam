extends Interactable

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D

@export var off_lines: Array[String]

@export var powered = false

signal power_up()


func interact(interactor: Player):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if not powered:
		if off_lines:
			interactor.text_box_active = true
			interactor.text_box.dialogueLines = off_lines
			interactor.text_box.show_text_box()
			await interactor.text_finished
		sprite.play("On")
		point_light_2d.show()
		powered = true
		power_up.emit()
	elif lines:
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = lines
		interactor.text_box.show_text_box()
		await interactor.text_finished
