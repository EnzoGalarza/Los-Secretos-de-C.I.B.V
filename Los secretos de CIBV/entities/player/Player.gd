extends KinematicBody2D
class_name Player

export (float) var ACCELERATION:float = 500.0
export (float) var SPEED_LIMIT:float = 400.0
export (float) var FRICTION_WEIGHT:float = 25.1
export (int) var gravity = 10

onready var state_machine = $StateMachine

var velocity : Vector2 = Vector2.ZERO
var movement : Vector2 = Vector2.ZERO

func _ready():
	state_machine.set_parent(self)

func _apply_movement():
	move_and_collide(velocity)
		
func _handle_deacceleration():
	velocity = velocity.slerp(movement,0.5)
	
func _handle_move_input(delta = 1):
	var h_movement : int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var v_movement : int = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	movement = Vector2(h_movement,v_movement)
	
	if movement != Vector2.ZERO:
		velocity += movement * ACCELERATION * delta
		velocity = velocity.clamped(SPEED_LIMIT * delta)
	
