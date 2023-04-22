extends Control

var isPaused = false


func _ready():
	hide()
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		setPaused(!isPaused)

func setPaused(p:bool):
	isPaused = p
	visible = p
	get_tree().paused = p
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Resume_pressed():
	setPaused(false)

func _on_Save_pressed():
	pass # Replace with function body.

func _on_Options_pressed():
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
