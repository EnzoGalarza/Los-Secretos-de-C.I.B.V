extends Node

onready var body: KinematicBody2D = $NPC
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("tecla_e"):
			_dialog('timeline-1')
			
			
func _on_AreaEvent_body_entered(body):
	if body.has_method("taked"):			
		if body.papel !=3:
			pass
		else:
			print("Te dejo pasar, pero es bajo tu propio riesgo...")
			Controller.abrir_puerta()
			body.papel = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func unpause(timeline_name):
	get_tree().paused = false

func _dialog(dia):
	var dialog = Dialogic.start(dia)
	dialog.pause_mode = Node2D.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end',self,'unpause')
	add_child(dialog)
	print("prueba si anda")
	get_tree().paused = true
			
