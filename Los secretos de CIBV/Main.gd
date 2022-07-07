extends Node

func _enter_tree():
	if Checkpoint.last_position != null:
		$Environment/Player.global_position = Checkpoint.last_position
		
func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
