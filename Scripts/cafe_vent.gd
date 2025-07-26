extends "res://Scripts/vent.gd"

func interact(interactor: Player):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if interactor.get_color() == Color(1,1,1,0.8):
		interactor.global_position += 4 * (global_position - interactor.global_position)
