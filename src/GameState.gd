extends Node

signal changed_scene

#const MAINMENU = preload("res://src/Menu/TitleMenu.tscn")
const Cursors = {
	Enums.CURSORS.Cancel: preload("res://Images/Cursors/cancel.png"),
	Enums.CURSORS.Default: preload("res://Images/Cursors/arrow.png"),
	Enums.CURSORS.Door: preload("res://Images/Cursors/door.png"),
	Enums.CURSORS.Eye: preload("res://Images/Cursors/eye.png"),
	Enums.CURSORS.Hand: preload("res://Images/Cursors/hand.png"),
	Enums.CURSORS.Over: preload("res://Images/Cursors/over.png"),
	Enums.CURSORS.Talk: preload("res://Images/Cursors/talk.png"),
}
var Chapter : PackedScene
var ChapInst
var CurrentScene
var Player


func LoadScene(path:String):
	var scn = load(path)
	await get_tree().change_scene_to(scn)
	CurrentScene = scn
	emit_signal("changed_scene")
	get_node("/root").move_child(ChapInst, 0)


func _load(chapter:PackedScene):
	get_tree().change_scene_to(chapter)
#	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("changed_scene")
	ChapInst = get_tree().current_scene
	get_node("/root").move_child(ChapInst, 0)
