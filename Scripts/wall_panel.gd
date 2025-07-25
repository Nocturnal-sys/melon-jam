extends Interactable

@export var connection: Activateable


func interact(interactor = null):
	connection.activate()
