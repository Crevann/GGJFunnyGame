extends Node2D

var has_to_start_game: bool
@export var game_can_restart: bool

func _ready():
	Game.connect("finish", game_end)
	game_can_restart = false
	$AnimationPlayer.play("Fade_in")

func _process(_delta):
	if(Input.is_action_just_pressed("attack") and !has_to_start_game):
		$AnimationPlayer.play("Intro")
		has_to_start_game = true
	
	if(Input.is_action_just_pressed("attack") and game_can_restart):
		Game.total_points = 0
		game_can_restart = false
		get_tree().reload_current_scene()
	
	if(Input.is_action_just_pressed("quit")):
		pass

func game_start():
	Game.start_game()

func game_end():
	$AnimationPlayer.play("Ending")

func game_restart():
	get_tree().quit()
