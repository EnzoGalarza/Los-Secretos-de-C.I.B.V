extends StaticBody2D


func abrir_puerta():
	get_node("Sprite").hide()
	queue_free()
	
