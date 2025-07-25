class_name vent
extends Interactable


func interact(interactor):
	interactor.global_position += 2 * (global_position - interactor.global_position)
