extends EnemyState

@onready var timer := $StaggerTimer

func state_physics_process(_delta: float):
	super(_delta)
	enemy.velocity = lerp(enemy.velocity, Vector2.ZERO, 0.15)
	
func state_enter():
	super()
	timer.start()
	pass

func _on_stagger_timer_timeout():
	if(enabled):
		emit_signal("transition", "Panic")
