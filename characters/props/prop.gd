extends CharacterBody2D

@onready var camera := $"../../Camera2D"

@export var KNOCKBACK: float = 1000.0

func _physics_process(_delta):
	velocity = lerp(velocity, Vector2.ZERO, 0.1)
	move_and_slide()
	
func _on_hurtbox_hit(other):
	var direction = global_position - other.global_position
	Game.hit_stop(0.1, 0.15)
	camera.shake_camera(0.1, 50)
	velocity = direction.normalized() * KNOCKBACK
	$PropSFXHit.pitch_scale = randf_range(0.9, 1.1)
	$PropSFXHit.play()
