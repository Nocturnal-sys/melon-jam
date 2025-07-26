extends Interactable

@export var denied_lines: Array[String]


func interact(interactor: Player):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if interactor.get_color() != Color(1,1,1,0.8):
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = denied_lines
		interactor.text_box.show_text_box()
	else:
		if lines:
			interactor.text_box_active = true
			interactor.text_box.dialogueLines = lines
			interactor.text_box.show_text_box()
			await interactor.text_box.finished
		interactor.global_position += 2 * (global_position - interactor.global_position)
