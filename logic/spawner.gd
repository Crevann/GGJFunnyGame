extends Node2D

@onready var enemy_to_spawn: PackedScene = preload("res://characters/enemy/enemy.tscn")
@onready var timer: Timer = $SpawnTimer

var berk_spawn = 0.2
@export var burst_to_spawn: int
@export var radius: float

func _ready():
	Game.connect("go_berk", berk_spawning)

func berk_spawning():
	timer.wait_time = berk_spawn
	timer.start()

func _on_spawn_timer_timeout():
	for i in burst_to_spawn:
		var instance = enemy_to_spawn.instantiate()
		instance.name = "Enemy"
		instance.position = Vector2(randf_range(-radius, radius), randf_range(-radius, radius))
		$"../YSortables".add_child(instance)
