extends KinematicBody2D

export(float) var speed : float = 150.0
export (float) var ACCELERATION:float = 300.0
export (float) var SPEED_LIMIT:float = 150.0
export (AudioStream) var fire_sfx

onready var detection_area = $DetectionArea 
onready var state_machine = $StateMachine
onready var animation_enemy = $AnimationEnemy
onready var enemy_sfx = $Sfx

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


func set_target_path(target_pos):
	target_path = nav.get_simple_path(get_position(),target_pos,false)
	
func _play_animation(animation : String):
	if animation_enemy.has_animation(animation):
		animation_enemy.play(animation)

func _stop_animation():
	animation_enemy.stop()
	
func _apply_movement():
	move_and_slide(move)
	
func _see_player():
	return detection_area.can_see_player()


func _on_Hitbox_body_entered(body):
	if body.has_method("notify_hit"):
		body.notify_hit()

func fire_audio():
	enemy_sfx.stream = fire_sfx
	enemy_sfx.play()

func _stop_fire_audio():
	enemy_sfx.stream = null
	enemy_sfx.stop()	
