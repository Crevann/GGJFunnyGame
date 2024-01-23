extends CharacterBody2D
class_name Enemy

@onready var camera := $"../../Camera2D"
@onready var player: Player

const SPEED = 300.0
const KNOCKBACK = 1200.0
var hp

func _ready():
	player = get_tree().get_first_node_in_group("player")
	add_to_group("enemies")
	hp = 2

func _physics_process(_delta):
	velocity = lerp(velocity, Vector2.ZERO, 0.1)
	move_and_slide()


func _on_hurtbox_hit(other):
	var direction = global_position - other.global_position
	Game.hit_stop(0.1, 0.15)
	camera.shake_camera(0.1, 50)
	velocity = direction.normalized() * KNOCKBACK
