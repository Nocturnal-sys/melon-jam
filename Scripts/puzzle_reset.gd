extends Activateable

@export var puzzle_elements: Array[Interactable]
@export var puzzle_positions: Array[Vector2]

func activate(_activator):
	for i in len(puzzle_elements):
		var element = puzzle_elements[i]
		element.global_position = puzzle_positions[i]
		
