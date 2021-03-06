extends Area2D

var player = null



func _on_DetectionArea_body_entered(body):
	if body is Player:
		player = body
		get_parent().fire_audio()
		$Timer.start(2)
		get_parent().warning()

func _on_DetectionArea_body_exited(body):
	$Timer.stop()
	player = null
	get_parent().warning()
	
func can_see_player():
	return player != null


func _on_Timer_timeout():
	if player != null:
		player.notify_hit()
		player = null
		
