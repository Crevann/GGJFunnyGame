extends CharacterBody2D
class_name Enemy

signal has_died(points: int)

@onready var camera := $"../../Camera2D"
@onready var player: Player

@export var points = 100
const SPEED = 200.0
const KNOCKBACK = 1200.0
var hp : int
var dead : bool

func _ready():
	player = get_tree().get_first_node_in_group("player")
	add_to_group("enemies")
	hp = 2

func _process(_delta):
	if(hp <= 0 and !dead):
		var state : State = $StateMachine.current_state
		state.emit_signal("transition", "Dead")
		Game.add_points(points)
		Game.current_combo += 1
		Game.combo_decay_timer.start()
		print(Game.total_points)
		print(Game.current_combo)

func _physics_process(_delta):
	move_and_slide()


func _on_hurtbox_hit(other):
	var direction = global_position - other.global_position
	Game.hit_stop(0.1, 0.15)
	camera.shake_camera(0.1, 50)
	hp = hp - other.damage
	var state : State = $StateMachine.current_state
	velocity = direction.normalized() * KNOCKBACK
	state.emit_signal("transition", "Stagger")
