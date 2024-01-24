extends PlayerState

var ATTACK_ANIMATIONS = ["Slap_1", "Slap_2"]

var current_attack = 1
var berking_cooldown = 0.1
@export var can_attack_again: bool

func state_process(_delta: float):
	if(can_attack_again):
		if(Input.is_action_just_pressed("attack")):
			emit_signal("transition", "Attack")

func state_physics_process(_delta: float):
	player.velocity = lerp(player.velocity, Vector2.ZERO, player.FRICTION)
		

func state_enter():
	current_attack += 1
	animation.play(ATTACK_ANIMATIONS[current_attack % 2])
	print(animation.current_animation)
	
	if(player.berking):
		animation.speed_scale = 2
	
	var dash_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(dash_direction.x > 0):
		$"../../Flip".scale.x = 1
	elif(dash_direction.x < 0):
		$"../../Flip".scale.x = -1
	player.velocity = dash_direction * player.DASH_SPEED
	if(dash_direction == Vector2.ZERO):
		player.velocity.x = player.facing * player.DASH_SPEED

func state_exit():
	animation.speed_scale = 1
	$"../../Flip/Hitbox/CollisionShape2D".disabled = true

func _on_animation_player_animation_finished(_anim_name):
	if(enabled):
		emit_signal("transition", "Movement")
