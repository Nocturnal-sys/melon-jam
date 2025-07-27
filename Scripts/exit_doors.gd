extends ProximityActivate

var locked = true


func activate(trigger):
	if not locked:
		for child in children:
			child.activate(self)


func _on_level_1_unlock_doors() -> void:
	locked = false
