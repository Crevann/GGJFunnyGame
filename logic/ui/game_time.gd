extends Label

func _process(_delta):
	if(Game.game_started):
		text = var_to_str(roundi(Game.game_timer.time_left))
