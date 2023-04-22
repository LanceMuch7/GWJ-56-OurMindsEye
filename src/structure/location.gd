extends Node2D


func _ready():
	GameState.CurrentScene = self
	if GameState.newGame:
		GameState.newGame = false
		$Girl.SetPosition($door2/spawn.global_position)
