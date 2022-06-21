extends CanvasLayer

func _input(event):
	if event.is_action_pressed("inventory"):
		$Player/Inventory/ItemList.visible = !$Player/Inventory/ItemList.visible
