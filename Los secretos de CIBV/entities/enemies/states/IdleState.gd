extends "res://entities/AbstractState.gd"

func update(delta:float):
	parent._idle(delta)
	if !parent._see_player():
		emit_signal("finished","walk")
