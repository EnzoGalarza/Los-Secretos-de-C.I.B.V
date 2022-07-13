extends KinematicBody2D
class_name Player

export (float) var ACCELERATION:float = 500.0
export (float) var SPEED_LIMIT:float = 400.0
export (float) var FRICTION_WEIGHT:float = 25.1
export (int) var gravity = 10

onready var state_machine = $StateMachine

onready var inventory : ItemList = $ItemList
onready var animation_player : AnimationPlayer = $AnimationPlayer


var velocity : Vector2 = Vector2.ZERO
var movement : Vector2 = Vector2.ZERO
var papel = 0

func _ready():
	state_machine.set_parent(self)

func _input(event):
	if event.is_action_pressed("tecla_e"):
		print("hola")
	
	if event.is_action_pressed("inventory"):
		inventory.visible = !inventory.visible

func _apply_movement():
# warning-ignore:return_value_discarded
	move_and_collide(velocity)
		
func _handle_deacceleration():
	velocity = velocity.linear_interpolate(movement,0.5)
	
func _handle_move_input(delta = 1):
	var h_movement : int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var v_movement : int = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	if h_movement > 0:
		_play_animation("caminar derecha")
	if h_movement < 0:
		_play_animation("Caminar izquierda")
	if v_movement > 0:
		_play_animation("Caminar Abajo")
	if v_movement < 0:
		_play_animation("Caminar arriba")		
	
	movement = Vector2(h_movement,v_movement)
	
	if movement != Vector2.ZERO:
		velocity += movement * ACCELERATION * delta
		velocity = velocity.clamped(SPEED_LIMIT * delta)

func _play_animation(animation):
	if animation_player.has_animation(animation):
		animation_player.play(animation)
		
func _stop_animation():
	animation_player.stop()
			
func notify_hit():
	get_tree().reload_current_scene()
	
func taked(item_name,item):	
	inventory.add_item(item_name,item.texture)	
	papel += 1
	if papel == 1:
		print ("agarraste 1 papel")
	else:
		print (str("agarraste ", papel," papeles"))
