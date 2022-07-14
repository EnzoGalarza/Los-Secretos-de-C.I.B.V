extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _dialog(dia):
	var dialog = Dialogic.start(dia)
	dialog.pause_mode = Node2D.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end',self,'unpause')
	add_child(dialog)
	print("prueba si anda")
	get_tree().paused = true

func abrir_puerta():
	get_node("Sprite").hide()
	queue_free()
	


func _on_Area2D_body_entered(body):
		if body.has_method("taked"):
			if body.llave !=1:
				_dialog('timeline-4')
			else:
			
				abrir_puerta()

func unpause(timeline_name):
	get_tree().paused = false
