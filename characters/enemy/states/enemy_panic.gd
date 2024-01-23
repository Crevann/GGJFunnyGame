extends EnemyState

const PLAYER_DISTANCE = 300

func state_process(_delta: float):
	if(enemy.velocity == Vector2.ZERO):
		animation.play("Idle")
	else:
		animation.play("Walk")
		
	if(enemy.velocity.x < 0):
		$"../../Flip".scale.x = -1
	elif(enemy.velocity.x > 0):
		$"../../Flip".scale.x = 1

func state_physics_process(_delta: float):
	super(_delta)
	var player_vector := enemy.global_position - enemy.player.global_position
	if(player_vector.length() < PLAYER_DISTANCE):
		enemy.velocity = player_vector.normalized() * enemy.SPEED
	else:
		enemy.velocity = Vector2.ZERO
	
func state_enter():
	pass

func state_exit():
	pass
