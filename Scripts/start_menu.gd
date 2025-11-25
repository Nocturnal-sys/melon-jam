extends Level

@onready var play_button: Button = $CanvasLayer/PlayButton
@onready var options_button: Button = $CanvasLayer/OptionsButton


func _ready():
	AudioManager.start_main_menu()
	reset_focus()


func reset_focus() -> void:
	play_button.grab_focus()


func _on_play_button_pressed() -> void:
	AudioManager.stop_main_menu()
	next_level()


func _on_options_button_pressed() -> void:
	LevelSwitcher.open_options()


func _on_play_button_mouse_entered() -> void:
	play_button.grab_focus()


func _on_play_button_focus_entered() -> void:
	AudioManager.play_select()
	play_button.text = ">Play"


func _on_play_button_focus_exited() -> void:
	play_button.text = "Play"


func _on_options_button_mouse_entered() -> void:
	options_button.grab_focus()


func _on_options_button_focus_entered() -> void:
	AudioManager.play_select()
	options_button.text = ">Options"


func _on_options_button_focus_exited() -> void:
	options_button.text = "Options"
