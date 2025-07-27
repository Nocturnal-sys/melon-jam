extends Activateable

@export var triggers: Array[Activateable]
@export var target: Activateable

var active: int = 0


func activate(trigger):
	print(trigger)
	for button in triggers:
		if button == trigger:
			active += 1
			print(active)
	if active == len(triggers):
		target.activate(self)
