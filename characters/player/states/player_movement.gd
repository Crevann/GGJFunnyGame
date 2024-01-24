extends PlayerState

func state_process(_delta: float):
	if(player.velocity == Vector2.ZERO):
		animation.play("Idle")
	else:
		animation.play("Walk")
	
	if(Input.get_axis("move_left", "move_right") < 0):
		player.facing = player.LEFT
	elif(Input.get_axis("move_left", "move_right") > 0):
		player.facing = player.RIGHT
	if(Input.is_action_just_pressed("attack")):
		emit_signal("transition", "Attack")
	
func state_physics_process(_delta: float):
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_direction:
		if player.berking:
			player.velocity = move_direction * player.SPEED_BERK
		else:
			player.velocity = move_direction * player.SPEED
	else:
		player.velocity = Vector2.ZERO

