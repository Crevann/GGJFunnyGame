extends Label

var current_score: int = Game.total_points
var update_step = 20

func _process(_delta):
	if(current_score < Game.total_points):
		current_score += update_step
	else:
		current_score = Game.total_points
	text = var_to_str(current_score).pad_zeros(7)
	
