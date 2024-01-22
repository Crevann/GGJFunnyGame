extends Node

var points: int

func _ready():
	points = 0

func hit_stop(timescale, duration):
	Engine.time_scale = timescale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1
	
