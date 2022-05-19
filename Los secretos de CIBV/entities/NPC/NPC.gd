extends KinematicBody2D



func _ready():
	pass # Replace with function body.



func _on_AreaEvent_body_entered(body):
	if body.has_method("taked"):
		if body.papel !=3:
			print("No tienes todos los papeles")
		else:
			print("Te dejo pasar, pero es bajo tu propio riesgo...")
			Controller.abrir_puerta()
			body.papel = 0
