extends Interactable

@onready var top: Sprite2D = $Top
@onready var light: PointLight2D = $Top/Light

@export var used: bool = false
@export var used_lines: Array[String]
@export var tube_color: Color

signal bestow()
var power_bestowed = false
var player: Player

func _ready() -> void:
	player = PlayerManager.get_player()
	if used:
		light.hide()
	top.modulate = tube_color
	bestow.connect(_bestow_power)


func interact(interactor):
	_display_text_box(interactor)

# shows text in text box
func _display_text_box(interactor):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if used:
		if used_lines:
			interactor.text_box_active = true
			interactor.text_box.dialogueLines = used_lines
			interactor.text_box.show_text_box()
	elif lines:
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = lines
		interactor.text_box.show_text_box()
		used = true


func _on_text_finished(interactable: Interactable):
	if interactable != self:
		return
	if !power_bestowed:
		bestow.emit()


func _bestow_power():
	var light_tween: Tween = create_tween()
	light_tween.tween_property(light,"global_position",player.global_position,1)
	await light_tween.finished
	PlayerManager.bestow_power(tube_color)
	light.hide()
	power_bestowed = true
