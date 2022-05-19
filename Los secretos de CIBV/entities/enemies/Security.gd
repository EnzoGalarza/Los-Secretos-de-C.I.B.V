extends KinematicBody2D

export(float) var speed : float = 60.0
export (float) var ACCELERATION:float = 300.0
export (float) var SPEED_LIMIT:float = 100.0
export (String, "loop", "linear") var patrol_type = "linear"

onready var detection_area = $DetectionArea 
onready var state_machine = $StateMachine
onready var path_follow = get_parent()
onready var start_position = global_position

var move : Vector2 = Vector2.ZERO
var direction = 1

func _patrol(delta):
	if patrol_type == 'loop':
		path_follow.offset += speed * delta

#func _physics_process(delta):
#	move.x = speed * direction
#	move_and_slide(Vector2(move.x,0),Vector2.UP)
#
#	if is_on_wall():
#		direction = direction * -1

func _ready():
	state_machine.set_parent(self)

func _chasing(delta):
	var target = detection_area.player
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		move = move.move_toward(direction * SPEED_LIMIT, ACCELERATION * delta)
		
func _apply_movement():
	move_and_slide(move)

func _return_position():
	var direction = (start_position - global_position).normalized()
	move = move.move_toward(direction * SPEED_LIMIT, ACCELERATION)

func _idle(delta):
	move = move.move_toward(Vector2.ZERO, 200 * delta)	

func _see_player():
	return detection_area.can_see_player()

func _stop_chasing():
	detection_area.player = null
