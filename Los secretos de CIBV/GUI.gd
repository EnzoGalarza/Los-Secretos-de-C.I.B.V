extends CanvasLayer

func _ready():
	_set_all_invisible()
	$TextureRect.visible = true

func _set_all_invisible():
	$TextureRect.visible = false
