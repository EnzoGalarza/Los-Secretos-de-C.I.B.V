extends KinematicBody2D

export(float) var speed : float = 60.0

onready var raycast = get_node("Vision")
var move : Vector2 = Vector2.ZERO
var direction = 1

func _physics_process(delta):
	move.x = speed * direction
	move_and_slide(Vector2(move.x,0),Vector2.UP)
	
	if is_on_wall():
		direction = direction * -1
		
	if raycast.is_colliding():
		print("te veo")	
