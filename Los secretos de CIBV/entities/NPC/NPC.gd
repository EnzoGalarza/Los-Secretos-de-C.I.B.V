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
			print("No tienes todos los papeles")
		else:
			print("Te dejo pasar, pero es bajo tu propio riesgo...")
			Controller.abrir_puerta()
			body.papel = 0


func _on_AreaEvent_body_exited(body):
	active = false


