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
	print(colors)


func cycle_color():
	if color_index < len(colors) - 1:
		color_index += 1
		player.change_color(colors[color_index])
	else:
		color_index = 0
		player.change_color(colors[color_index])
