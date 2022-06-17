extends KinematicBody2D

export(float) var speed : float = 90.0
export (float) var ACCELERATION:float = 300.0
export (float) var SPEED_LIMIT:float = 100.0

onready var detection_area = $DetectionArea 
onready var state_machine = $StateMachine

var move : Vector2 = Vector2.ZERO
var direction = 1
var target_position : Vector2 = Vector2()
var objetivos = PoolVector2Array()
var nav = Navigation2D
var path : Array = []
var index : int = 0
var target_path : Array = []

func _ready():
	var goals = get_parent().get_node("PuntosPatrulla").get_children()
	for objetivo in goals:
		objetivos.append(objetivo.get_position())
	state_machine.set_parent(self)
	nav = get_tree().get_nodes_in_group("nav")[0]
	set_path()

func _patrol(delta):
	if(path.size() > 1):
		var d = get_position().distance_to(path[0])
		look_at(path[0])
		if(d > 2):
			set_position(get_position().linear_interpolate(path[0],(speed*delta)/d))		
		else:
			path.remove(0)
	else:
		if(index < (objetivos.size() - 1)):
			index += 1
		else:
			index = 0
		set_path()			
		
func set_path():
	path = nav.get_simple_path(get_position(),objetivos[index],false)
	
func _chasing(delta):
	var target = detection_area.player
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		move = move.move_toward(direction * SPEED_LIMIT, ACCELERATION * delta)

func set_target_path(target_pos):
	target_path = nav.get_simple_path(get_position(),target_pos,false)
	
func _apply_movement():
	move_and_slide(move)

func _idle(delta):
	move = move.move_toward(Vector2.ZERO, 200 * delta)	

func _see_player():
	return detection_area.can_see_player()

func _stop_chasing():
	detection_area.player = null
	move = Vector2()
	


func _on_Hitbox_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit()
		_stop_chasing()
