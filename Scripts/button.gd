extends ProximityActivate


func _on_area_entered(area: Node2D) -> void:
	if area is Pushable:
		activate(self)
		area.disable_push()


func _on_area_exited(area: Node2D) -> void:
	activate(area)
