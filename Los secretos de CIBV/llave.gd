extends Area2D


onready var item_name = "llave"




func delete():
	get_node("Sprite").hide()
	queue_free()



func _on_Llave_body_entered(body):
		if body.has_method("taked2"):
		
			body.taked2(item_name,get_node("Sprite"))
			delete()

