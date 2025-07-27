extends Level


func _ready():
	AudioManager.start_main_menu()


func _on_play_button_pressed() -> void:
	AudioManager.stop_main_menu()
	next_level()


func _on_options_button_pressed() -> void:
	LevelSwitcher.open_options(self)
