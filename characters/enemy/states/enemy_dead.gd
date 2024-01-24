extends EnemyState

func state_enter():
	super()
	enemy.dead = true

func state_physics_process(_delta):
	enemy.velocity = lerp(enemy.velocity, Vector2.ZERO, 0.1)
