extends "res://entities/AbstractState.gd"


func update(delta):
	parent._handle_move_input(delta)
	parent._apply_movement()
	if parent.movement == Vector2.ZERO:
		emit_signal("finished", "idle")
