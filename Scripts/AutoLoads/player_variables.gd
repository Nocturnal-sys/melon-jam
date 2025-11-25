extends Node

var player: Player
var colors: Array[Color]
var color_index: int


func add_player(play: Player):
	player = play
	colors.append(player.get_color())
	color_index = 0


func get_player():
	return player


func bestow_power(color: Color):
	colors.append(color)
	color_index += 1
	player.change_color(color)


func cycle_color(direction : bool):
	if direction == true:
		if color_index == len(colors) - 1:
			color_index = 0
		else:
			color_index += 1
	else:
		if color_index == 0:
			color_index = len(colors) - 1
		else:
			color_index -= 1
	player.change_color(colors[color_index])
