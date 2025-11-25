extends Level

@export var camera: Camera2D
@export var current: Level
@onready var mute_main: CheckButton = $Content/Main/MainSlider/Mute

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	reset_focus()


func reset_focus() -> void:
	mute_main.grab_focus()


func _on_back_button_pressed() -> void:
	LevelSwitcher.close_options()


func _on_back_button_focus_entered() -> void:
	AudioManager.play_select()
