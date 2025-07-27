extends Node

#const PAUSE_MENU = preload("res://Scenes/Levels/pause_menu.tscn")
#const OPTIONS_MENU = preload("res://Scenes/Levels/options_menu.tscn")

var current_level : Level = null
#var pause_menu: Level
#var options_menu: Level

func _ready() -> void:
	current_level = get_tree().root.get_child(-1)


#func open_options(menu: Level, cam: Camera2D):
	#options_menu = OPTIONS_MENU.instantiate()
	#options_menu.camera = cam
	#get_tree().root.add_child(options_menu)


#func close_options(menu: Level):
	#if get_tree().root.get_child(-1) != menu:
		#get_tree().root.get_child(-1).queue_free()


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
