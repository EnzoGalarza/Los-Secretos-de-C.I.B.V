extends Area2D

func delete():
	get_node("sprite").hide()
	queue_free()


func _on_Papel_body_entered(body):
	if body.has_method("taked"):
		delete()
		body.taked()
