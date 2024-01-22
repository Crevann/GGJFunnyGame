extends PlayerState

func state_process(_delta: float):
	if(Input.get_axis("move_left", "move_right") < 0):
		player.facing = player.LEFT
	elif(Input.get_axis("move_left", "move_right") > 0):
		player.facing = player.RIGHT
	$"../../Flip".scale.x = player.facing if player.facing != player.NEUTRAL else player.facing
	if(Input.is_action_just_pressed("attack")):
		emit_signal("transition", "Attack")
	
func state_physics_process(_delta: float):
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_direction:
		player.velocity = move_direction * player.SPEED
	else:
		player.velocity = lerp(player.velocity, Vector2.ZERO, player.DECELLARATION)

func state_enter():
	pass

func state_exit():
	pass
