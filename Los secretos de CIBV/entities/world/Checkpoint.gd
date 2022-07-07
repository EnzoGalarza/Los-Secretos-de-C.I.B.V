extends Area2D



func _on_Checkpoint_body_entered(body):
	Checkpoint.last_position = global_position
