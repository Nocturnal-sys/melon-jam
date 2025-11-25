extends HSlider

@onready var label: Label = $Value
@onready var mute: CheckButton = $Mute
@onready var volume_slider: HSlider = $"."

@export
var bus_name: String
var bus_index: int


func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	set_value_no_signal(db_to_linear(AudioServer.get_bus_volume_db(bus_index)))
	mute.set_pressed_no_signal(not AudioServer.is_bus_mute(bus_index)) 


func _process(delta: float) -> void:
	label.text = str(int(value*100))

	if Input.is_action_pressed("ui_left") and mute.has_focus():
		volume_slider.value -= 0.01

	if Input.is_action_pressed("ui_right") and mute.has_focus():
		volume_slider.value += 0.01


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	AudioManager.play_select()


func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(bus_index, not AudioServer.is_bus_mute(bus_index))


func _on_mute_focus_entered() -> void:
	AudioManager.play_select()
	mute.modulate = Color("00ff00")


func _on_mute_focus_exited() -> void:
	mute.modulate = Color("00a900")


func _on_mute_mouse_entered() -> void:
	mute.grab_focus()


func _on_mouse_entered() -> void:
	mute.grab_focus()
