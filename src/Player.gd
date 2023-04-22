extends Node

var character:CharacterBody2D


#func _ready():
#	character = charResource.instantiate()
#	add_sibling(character)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		Select(GameState.CurrentScene.get_global_mouse_position())

func Select(loc:Vector2):
	if is_instance_valid(character):
		character.SetDestination(loc)

func SelectObject(tgt:Node2D):
	if is_instance_valid(character):
		character.setTarget(tgt)

func SetCharacter(c:CharacterBody2D):
	character = c
