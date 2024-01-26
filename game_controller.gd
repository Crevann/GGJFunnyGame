extends Node2D

var has_to_start_game: bool

func _process(_delta):
	if(Input.is_action_just_pressed("attack") and !has_to_start_game):
		$AnimationPlayer.play("Intro")
		has_to_start_game = true

func game_start():
	Game.start_game()
	
