extends Node

var parent


signal finished(next_state_name)

# Initialize the state. E.g. change the animation
func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return


func handle_input(event:InputEvent):
	return


func update(delta:float):
	return


func _on_animation_finished(anim_name:String):
	return
