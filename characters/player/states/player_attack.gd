extends PlayerState

@onready var timer := $DashTimer
	
func state_physics_process(_delta: float):
	player.velocity = lerp(player.velocity, Vector2.ZERO, player.DECELLARATION)
		

func state_enter():
	super()
	timer.start()
	var dash_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = dash_direction * player.DASH_SPEED
	if(dash_direction == Vector2.ZERO):
		player.velocity.x = player.facing * player.DASH_SPEED

func _on_dash_timer_timeout():
	if(enabled):
		emit_signal("transition", "Movement")
