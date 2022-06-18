extends "res://entities/AbstractState.gd"

func update(delta):
	parent._patrol(delta)
	if parent._see_player():
		emit_signal("finished","idle")
