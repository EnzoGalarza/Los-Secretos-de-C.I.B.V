extends Area2D

var player = null

func _on_DetectionArea_body_entered(body):
	player = body
	$Timer.stop()
	

func _on_DetectionArea_body_exited(body):
	$Timer.start(5)

func can_see_player():
	return player != null
