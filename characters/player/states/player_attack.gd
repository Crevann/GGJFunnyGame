extends PlayerState

var ATTACK_ANIMATIONS = ["Slap_1", "Slap_2"]

var current_attack = 1
@onready var timer := $DashTimer
var berking_cooldown = 0.1
	
func state_physics_process(_delta: float):
	player.velocity = lerp(player.velocity, Vector2.ZERO, player.FRICTION)
		

func state_enter():
	current_attack += 1
	animation.play(ATTACK_ANIMATIONS[current_attack % 2])
	print(animation.current_animation)
	
	if(player.berking):
		timer.wait_time = berking_cooldown
	timer.start()
	
	var dash_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = dash_direction * player.DASH_SPEED
	if(dash_direction == Vector2.ZERO):
		player.velocity.x = player.facing * player.DASH_SPEED

func state_exit():
	$"../../Flip/Hitbox/CollisionShape2D".disabled = true

func _on_dash_timer_timeout():
	if(enabled):
		emit_signal("transition", "Movement")
