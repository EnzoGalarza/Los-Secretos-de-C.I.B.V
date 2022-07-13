extends "res://entities/AbstractState.gd"

func enter():
	parent._play_animation("Caminar")
	parent._stop_fire_audio()

func update(delta):
	parent._patrol(delta)
	if parent._see_player():
		emit_signal("finished","idle")
