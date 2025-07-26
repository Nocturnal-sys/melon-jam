class_name ActiveContainer
extends Activateable

@export var children: Array[Activateable]

func activate(trigger):
	for child in children:
		child.activate(null)
