class_name ActiveContainer
extends Activateable

@export var children: Array[Activateable]

func activate():
	for child in children:
		child.activate()
