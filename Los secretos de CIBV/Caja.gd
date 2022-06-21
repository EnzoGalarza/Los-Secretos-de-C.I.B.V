extends StaticBody2D

onready var tween:Tween = $Tween
onready var raycast:RayCast2D = $RayCast2D
onready var raycast1:RayCast2D = $RayCast2D2
onready var raycast2:RayCast2D = $RayCast2D3
onready var raycast3:RayCast2D = $RayCast2D4
onready var raycast4:RayCast2D = $RayCast2D5
onready var raycast5:RayCast2D = $RayCast2D6

export (Vector2) var grid_cell_size: Vector2


func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		var raw_dir:Vector2 = (global_position - body.global_position).normalized()
		var direction:Vector2 = raw_dir.round()
		print(direction)
		var horizontal:bool = abs(raw_dir.x - direction.x) < abs(raw_dir.y - direction.y)
		var final_direction:Vector2 = Vector2(direction.x * float(horizontal), direction.y * float(!horizontal))
		print(final_direction)
		
		raycast.cast_to = final_direction * grid_cell_size
		raycast1.cast_to = final_direction * grid_cell_size
		raycast2.cast_to = final_direction * grid_cell_size
		raycast3.cast_to = final_direction * grid_cell_size
		raycast4.cast_to = final_direction * grid_cell_size
		raycast5.cast_to = final_direction * grid_cell_size
		raycast.force_raycast_update()
		raycast1.force_raycast_update()
		raycast2.force_raycast_update()
		raycast3.force_raycast_update()
		raycast4.force_raycast_update()
		raycast5.force_raycast_update()
		if !raycast.is_colliding() && !raycast1.is_colliding() && !raycast2.is_colliding() && !raycast3.is_colliding() && !raycast4.is_colliding() && !raycast5.is_colliding():
			var final_pos: Vector2 = position + final_direction * grid_cell_size 
			tween.interpolate_property(self, "position", position, final_pos, 1, Tween.TRANS_SINE)
			tween.start()
		else:
			print("No me puedo mover!")
