extends Level

@export var camera: Camera2D
@export var current: Level
@onready var content: Node2D = $Content

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_back_button_pressed() -> void:
	LevelSwitcher.close_options(current)


func _on_sfx_slider_drag_started() -> void:
	AudioManager.computer_interface = true
	AudioManager.play_computer_sounds()


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	AudioManager.computer_interface = false
	AudioManager.stop_computer_sounds()
