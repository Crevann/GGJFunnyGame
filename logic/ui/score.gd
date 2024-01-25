extends Label

var current_score: int = Game.total_points
var update_step = 20

func _process(_delta):
	if(current_score < Game.total_points):
		current_score += update_step
	text = var_to_str(current_score).pad_zeros(7)
	
