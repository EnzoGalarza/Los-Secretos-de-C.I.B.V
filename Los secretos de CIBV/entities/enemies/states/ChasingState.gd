extends "res://entities/AbstractState.gd"

func update(delta):
	parent._chasing(delta)
	parent._apply_movement()

func _on_Timer_timeout():
	emit_signal("finished","walk")

func exit():
	parent._return_position()
	print(parent.move)
