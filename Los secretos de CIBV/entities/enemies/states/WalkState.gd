extends "res://entities/AbstractState.gd"

func enter():
	parent._stop_chasing()

func update(delta):
	parent._patrol(delta)
	if parent._see_player():
		emit_signal("finished","chasing")
