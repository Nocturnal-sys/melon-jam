extends Interactable

@export var denied_lines: Array[String]


func interact(interactor):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	interactor.global_position += 2 * (global_position - interactor.global_position)
