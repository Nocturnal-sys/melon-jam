extends Node2D
@onready var main_menu: AudioStreamPlayer = $MainMenu
@onready var computer_sounds: AudioStreamPlayer = $ComputerSounds
@onready var main_loop: AudioStreamPlayer = $MainLoop
@onready var win_music: AudioStreamPlayer = $WinMusic
@onready var lights_on: AudioStreamPlayer = $LightsOn

var computer_interface = false
var fade_out_tween: Tween
var fade_in_tween: Tween


func start_main_menu():
	main_menu.volume_db = linear_to_db(0.01)
	if fade_in_tween:
		fade_in_tween.kill()
	main_menu.play()
	fade_in_tween = create_tween()
	fade_in_tween.tween_property(main_menu, "volume_db", linear_to_db(0.5),2)

func stop_main_menu():
	if fade_out_tween:
		fade_out_tween.kill()
	fade_out_tween = create_tween()
	fade_out_tween.tween_property(main_menu,"volume_db",linear_to_db(0.01),2)
	await fade_out_tween.finished
	main_menu.stop()


func start_main_loop():
	main_loop.volume_db = linear_to_db(0.01)
	if fade_in_tween:
		fade_in_tween.kill()
	main_loop.play()
	fade_in_tween = create_tween()
	fade_in_tween.tween_property(main_loop, "volume_db", linear_to_db(1),2)


func stop_main_loop():
	if fade_out_tween:
		fade_out_tween.kill()
	fade_out_tween = create_tween()
	fade_out_tween.tween_property(main_loop,"volume_db",linear_to_db(0.01),2)
	await fade_out_tween.finished
	main_loop.stop()


func start_win_music():
	win_music.volume_db = linear_to_db(0.01)
	if fade_in_tween:
		fade_in_tween.kill()
	win_music.play()
	fade_in_tween = create_tween()
	fade_in_tween.tween_property(win_music, "volume_db", linear_to_db(0.5),1)


func stop_win_music():
	if fade_out_tween:
		fade_out_tween.kill()
	fade_out_tween = create_tween()
	fade_out_tween.tween_property(win_music,"volume_db",linear_to_db(0.01),2)
	await fade_out_tween.finished
	win_music.stop()


func start_lights_on():
	lights_on.volume_db = linear_to_db(0.01)
	if fade_in_tween:
		fade_in_tween.kill()
	lights_on.play()
	fade_in_tween = create_tween()
	fade_in_tween.tween_property(lights_on, "volume_db", linear_to_db(1),1)


func stop_lights_on():
	if fade_out_tween:
		fade_out_tween.kill()
	fade_out_tween = create_tween()
	fade_out_tween.tween_property(lights_on,"volume_db",linear_to_db(0.01),2)
	await fade_out_tween.finished
	lights_on.stop()


func play_computer_sounds():
	if computer_interface:
		computer_sounds.play()


func stop_computer_sounds():
	computer_sounds.stop()
