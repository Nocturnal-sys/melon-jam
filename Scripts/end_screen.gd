extends Level

@onready var re_play_button: Button = $CanvasLayer2/RePlayButton


func _ready() -> void:
	AudioManager.start_win_music()
	reset_focus()


func reset_focus() -> void:
	re_play_button.grab_focus()


func _on_re_play_button_pressed() -> void:
	AudioManager.stop_win_music()
	next_level()
