extends ParallaxBackground

var dir = Vector2(1,1)
var speed = 100

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	scroll_base_offset += dir * speed * delta

func hide():
	$ParallaxLayer/Sprite.visible = false
	set_physics_process(false)
