extends Interactable

@export var connection: Activateable


func interact():
	connection.activate()
