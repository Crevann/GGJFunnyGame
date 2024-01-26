extends Label

func _process(_delta):
	if(Game.game_started):
		text = var_to_str(ceili(Game.game_timer.time_left))
