extends Node

signal changed_scene

#const MAINMENU = preload("res://src/Menu/TitleMenu.tscn")
const Cursors = {
	Enums.CURSORS.Cancel: preload("res://images/Cursors/cancel.png"),
	Enums.CURSORS.Default: preload("res://images/Cursors/arrow.png"),
	Enums.CURSORS.Door: preload("res://images/Cursors/door.png"),
	Enums.CURSORS.Eye: preload("res://images/Cursors/eye.png"),
	Enums.CURSORS.Hand: preload("res://images/Cursors/hand.png"),
	Enums.CURSORS.Over: preload("res://images/Cursors/over.png"),
	Enums.CURSORS.Talk: preload("res://images/Cursors/talk.png"),
}

var CurrentScene:Node2D
var SpawnPoint:Marker2D
var newGame:bool = true


# Go to a new location by changing active scenes
func LoadScene(path:String, door:String):
	await get_tree().change_scene_to_file(path)
	CurrentScene = get_tree().current_scene
	await get_tree().create_timer(0.1).timeout
	get_node("/root").move_child(CurrentScene, 0)
	await get_tree().create_timer(0.05).timeout
	if is_instance_valid(Player.character) and is_instance_valid(CurrentScene.find_child(door)):
		Player.character.SetPosition(CurrentScene.find_child(door).get_child(1).global_position)
	emit_signal("changed_scene")
