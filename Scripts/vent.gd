extends Interactable
@onready var text_box: TextBox = $TextBox


func interact(interactor):
	if textColor:
		text_box.change_text_color(textColor)
	interactor.global_position += 2 * (global_position - interactor.global_position)
