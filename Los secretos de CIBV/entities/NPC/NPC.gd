extends KinematicBody2D


onready var question = $Question

var active = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	question.visible = active


func _on_AreaEvent_body_entered(body):
	if body.has_method("taked"):
		active = true
		if body.papel !=3:
			_dialog('timeline-1')
		else:
			_dialog('timeline-3')
			Controller.abrir_puerta()
			body.papel = 0

func unpause(timeline_name):
	get_tree().paused = false

	

func _dialog(dia):
	var dialog = Dialogic.start(dia)
	dialog.pause_mode = Node2D.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end',self,'unpause')
	add_child(dialog)
	print("prueba si anda")
	get_tree().paused = true



func _on_AreaEvent_body_exited(body):
	active = false



