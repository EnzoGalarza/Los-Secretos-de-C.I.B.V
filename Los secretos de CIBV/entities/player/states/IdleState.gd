extends "res://entities/AbstractState.gd"

func handle_input(event:InputEvent):
	if event.is_action_pressed("move_left") || event.is_action_pressed("move_right") || event.is_action_pressed("move_down") || event.is_action_pressed("move_up"):
		emit_signal("finished", "walk")

func update(delta:float):
	parent._handle_deacceleration()
	parent._apply_movement()
