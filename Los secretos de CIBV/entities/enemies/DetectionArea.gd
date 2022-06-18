extends Area2D

var player = null

func _on_DetectionArea_body_entered(body):
	if body is Player:
		player = body
		$Timer.start(2)

func _on_DetectionArea_body_exited(body):
	$Timer.stop()
	player = null
	
func can_see_player():
	return player != null


func _on_Timer_timeout():
	if player != null:
		player.notify_hit()
		player = null
