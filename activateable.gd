extends Activateable

@export var target: Activateable
@export var triggers: Array[Activateable]

var active: int = 0


func activate(trigger):
	for button in triggers:
		if button == trigger:
			active += 1
	if active == 2:
		target.activate(self)
