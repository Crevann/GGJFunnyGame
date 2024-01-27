extends Node

signal start()
signal finish()
signal points_added(points: int)
signal go_berk()

var total_points: int
var current_combo: int = 0
var max_combo: int = 4
var game_started: bool

var combo_decay_timer: Timer
var combo_decay_time: float = 1

var game_timer: Timer
var game_time: float = 60

var current_alive_enemies = 0
var max_enemies_alive = 30

func _ready():
	total_points = 0
	
	combo_decay_timer = Timer.new()
	combo_decay_timer.wait_time = combo_decay_time
	combo_decay_timer.autostart = true
	combo_decay_timer.connect("timeout", combo_decay)
	game_timer = Timer.new()
	game_timer.wait_time = game_time
	game_timer.one_shot = true
	game_timer.connect("timeout", end_game)
	add_child(combo_decay_timer)
	add_child(game_timer)

func _process(_delta):
	current_combo = clamp(current_combo, 0, max_combo)

func add_points(new_points):
	total_points += new_points * current_combo
	emit_signal("points_added", new_points * current_combo)

func hit_stop(timescale, duration):
	Engine.time_scale = timescale
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1

func combo_decay():
	if(current_combo > 0):
		current_combo -= 1

func start_game():
	print("Game has started")
	game_started = true
	game_timer.start()
	total_points = 0
	current_alive_enemies = 0
	emit_signal("start")
	

func end_game():
	print("Game has finished")
	game_started = false
	emit_signal("finish")
