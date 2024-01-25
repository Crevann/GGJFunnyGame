extends Label

func _process(delta):
	text = var_to_str(ceili(Game.game_timer.time_left))
