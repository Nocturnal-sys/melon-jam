extends Interactable

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var generator_hum: AudioStreamPlayer2D = $GeneratorHum
@onready var generator_light: PointLight2D = $GeneratorHum/GeneratorLight

@export var off_lines: Array[String]

@export var powered = false

signal power_up()


func interact(interactor: Player):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if not powered:
		if off_lines:
			AudioManager.computer_interface = true
			interactor.text_box_active = true
			interactor.text_box.dialogueLines = off_lines
			interactor.text_box.show_text_box()
			await interactor.text_finished
		AudioManager.computer_interface = false
		sprite.play("On")
		point_light_2d.show()
		generator_hum.play()
		generator_light.show()
		powered = true
		power_up.emit()
	elif lines:
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = lines
		interactor.text_box.show_text_box()
		AudioManager.computer_interface = true
		await interactor.text_finished
		AudioManager.computer_interface = false
