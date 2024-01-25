extends Node2D

@onready var enemy_to_spawn: PackedScene = preload("res://characters/enemy/enemy.tscn")
@onready var timer: Timer = $SpawnTimer

var berk_spawn = 0.4
var enabled: bool
@export var burst_to_spawn: int
@export var radius: float

func _ready():
	Game.connect("go_berk", berk_spawning)

func berk_spawning():
	timer.wait_time = berk_spawn
	timer.start()

func _on_spawn_timer_timeout():
	if(enabled):
		for i in burst_to_spawn:
			if(Game.current_alive_enemies < Game.max_enemies_alive):
				var instance = enemy_to_spawn.instantiate()
				instance.name = "Enemy"
				instance.position = position + Vector2(randf_range(-radius, radius), randf_range(-radius, radius))
				$"../YSortables".add_child(instance)
				if(!Game.go_berk):
					Game.current_alive_enemies += 1


func _on_visible_on_screen_notifier_2d_screen_entered():
	enabled = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	enabled = true
