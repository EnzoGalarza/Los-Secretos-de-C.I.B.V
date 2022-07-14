extends Area2D

onready var item_name = "papel"

export (AudioStream) var objetSound
onready var sound = $AudioStreamPlayer

func delete():
	get_node("Sprite").hide()
	queue_free()


func _on_Papel_body_entered(body):
	if body.has_method("taked"):
		sound_effect()
		body.taked(item_name,get_node("Sprite"))
		delete()
	sound_effect()

func sound_effect():
	sound.stream = objetSound
	sound.play()
	
