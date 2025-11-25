extends Node

#const PAUSE_MENU = preload("res://Scenes/Levels/pause_menu.tscn")
const OPTIONS_MENU = preload("res://Scenes/options_menu.tscn")

var current_level : Level = null
#var pause_menu: Level
var options_menu: Level
var options_open: bool = false


func _ready() -> void:
	current_level = get_tree().root.get_child(-1)
	process_mode = Node.PROCESS_MODE_ALWAYS


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if options_open:
			close_options()
		else:
			open_options()

func open_options():
	options_menu = OPTIONS_MENU.instantiate()
	get_tree().root.call_deferred("add_child",options_menu)
	get_tree().paused = true
	options_open = true


func close_options():
	if get_tree().root.get_child(-1) != current_level:
		get_tree().root.get_child(-1).queue_free()
	current_level.reset_focus()
	get_tree().paused = false
	options_open = false


#func pause_game(current: Level, cam: Camera2D):
	#get_tree().paused = true
	#pause_menu = PAUSE_MENU.instantiate()
	#pause_menu.camera = cam
	#get_tree().root.add_child(pause_menu)
	#pause_menu.next = current.get_path()
	#pause_menu.current = current


#func resume_game(current: Level):
	#get_tree().paused = false
	#if get_tree().root.get_child(-1) != current:
		#get_tree().root.get_child(-1).queue_free()


#called from level to switch to next level
func advance_level(next : String):
	_deferred_goto_level.call_deferred(next)
	current_level = get_tree().root.get_child(-1)


#func reset_level():
	#_deferred_reset_level.call_deferred()


#func _deferred_reset_level():
	#get_tree().reload_current_scene()


	#get the current version of the main scene and free it, before loading
	#the next scene, which is stored in the level's "next" variable and
	#passed to this function
func _deferred_goto_level(path : String):
	current_level = get_tree().root.get_child(-1)
	current_level.free()
	var level = ResourceLoader.load(path)
	current_level = level.instantiate()
	get_tree().root.add_child(current_level)
	get_tree().current_scene = current_level
