extends Node

var main = null

func abrir_puerta():
	main.get_node("Puerta").abrir_puerta()


func _ready():
	var root = get_tree().get_root()
	main = root.get_child(root.get_child_count() - 1)
	
