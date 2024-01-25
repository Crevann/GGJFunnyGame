extends TextureProgressBar

@onready var player: Player = get_tree().get_first_node_in_group("player")
var shake = 10
var update_step = 2

func _process(delta):
	if(value < player.berk_value):
		value += update_step
	
	if(player.berking):
		offset_top = randf_range(0, shake)
		offset_bottom = randf_range(0, shake)
		offset_left = randf_range(0, shake)
		offset_right = randf_range(0, shake)
	else:
		offset_top = 0
		offset_bottom = 0
		offset_left = 0
		offset_right = 0
