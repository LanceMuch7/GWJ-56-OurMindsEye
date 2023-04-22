extends Node

var character:CharacterBody2D
@export var ScreenshotPath:String = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)#"c:/tmp/"#


func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		character.ClearTarget()
		Select(GameState.CurrentScene.get_global_mouse_position())
	elif event.is_action_pressed("screenshot"):
		var t = Time.get_unix_time_from_system()
		var d:Dictionary = Time.get_datetime_dict_from_unix_time(t)
		var fn = "GWJ-56-OME_%d-%s-%d_%02d%02d%02d.png" % [d.year,d.month,d.day,d.hour,d.minute,d.second]
		var image = get_viewport().get_texture().get_image()
#		image.flip_y()
		image.save_png(ScreenshotPath + "/" + fn)
		print("saved image to: " + ScreenshotPath + "/" + fn)

func Select(loc:Vector2):
	if is_instance_valid(character):
		character.SetDestination(loc)

func SelectObject(tgt:Node2D):
	if is_instance_valid(character):
		character.SetTarget(tgt)

func SetCharacter(c:CharacterBody2D):
	character = c
