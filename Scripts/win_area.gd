extends NotificationArea

signal win_game()


func activate(trigger: Player):
	super(trigger)
	win_game.emit()
