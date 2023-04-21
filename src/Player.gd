extends Node

var character:CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		Select(GameState.CurrentScene.get_global_mouse_position())

func Select(loc:Vector2):
	if is_instance_valid(character):
		character.SetDestination(loc)

func SelectObject(tgt:Node2D):
	if is_instance_valid(character):
		#@TODO: ...what? There was something I'm sure...
		character.SetDestination(tgt.global_position)

func SetCharacter(c:CharacterBody2D):
	character = c
