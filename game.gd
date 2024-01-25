extends Node

signal finish()

var total_points: int
var current_combo: int = 0
var max_combo: int = 4

var combo_decay_timer: Timer
var combo_decay_time: float = 2.0

var game_timer: Timer
var game_time: float = 60.0

func _ready():
	total_points = 0
	
	combo_decay_timer = Timer.new()
	combo_decay_timer.wait_time = combo_decay_time
	combo_decay_timer.autostart = true
	combo_decay_timer.connect("timeout", combo_decay)
	game_timer = Timer.new()
	game_timer.wait_time = game_time
	game_timer.autostart = true
	game_timer.one_shot = true
	game_timer.connect("timeout", end_game)
	add_child(combo_decay_timer)
	add_child(game_timer)

func _process(_delta):
	current_combo = clamp(current_combo, 0, max_combo)

func add_points(new_points):
	total_points += new_points * current_combo

func hit_stop(timescale, duration):
	Engine.time_scale = timescale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1

func combo_decay():
	if(current_combo > 0):
		current_combo -= 1

func end_game():
	print("Game has finished")
	emit_signal("finish")
