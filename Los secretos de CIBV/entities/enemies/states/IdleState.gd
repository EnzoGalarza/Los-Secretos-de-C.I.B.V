extends "res://entities/AbstractState.gd"

func enter():
	parent._stop_animation()
	parent._play_animation("idle")

func update(delta:float):
	if !parent._see_player():
		emit_signal("finished","walk")
