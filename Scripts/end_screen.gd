extends Level


func _ready() -> void:
	AudioManager.start_win_music()


func _on_re_play_button_pressed() -> void:
	AudioManager.stop_win_music()
	next_level()
