extends Interactable
@onready var text_box: TextBox = $TextBox


func interact(interactor):
	if textColor:
		interactor.text_box.change_text_color(textColor)
	if lines:
		interactor.text_box_active = true
		interactor.text_box.dialogueLines = lines
		interactor.text_box.show_text_box()
