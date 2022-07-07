extends Node


func _enter_tree():
	if Checkpoint.last_position != null:
		$Environment/Player.global_position = Checkpoint.last_position
