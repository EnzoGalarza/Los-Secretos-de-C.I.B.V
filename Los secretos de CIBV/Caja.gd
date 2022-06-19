extends StaticBody2D

onready var tween:Tween = $Tween
onready var raycast:RayCast2D = $RayCast2D

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
		raycast.force_raycast_update()
		if !raycast.is_colliding():
			var final_pos: Vector2 = position + final_direction * grid_cell_size
			tween.interpolate_property(self, "position", position, final_pos, 1.5, Tween.TRANS_SINE)
			tween.start()
		else:
			print("No me puedo mover!")
