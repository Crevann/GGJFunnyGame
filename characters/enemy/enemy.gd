extends CharacterBody2D
class_name Enemy

@onready var camera := $"../../Camera2D"
const SPEED = 300.0
const KNOCKBACK = 1200.0
var hp

func _ready():
	hp = 2

func _physics_process(delta):
	velocity = lerp(velocity, Vector2.ZERO, 0.1)
	move_and_slide()


func _on_hurtbox_hit(other):
	var direction = global_position - other.global_position
	Game.hit_stop(0.1, 0.15)
	camera.shake_camera(0.1, 50)
	velocity = direction.normalized() * KNOCKBACK
