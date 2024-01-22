extends Camera2D
class_name ShakableCamera

@export var shake_strength = 150

@onready var shake_timer := $ShakeTimer
@onready var rng = RandomNumberGenerator.new()

func _process(_delta):
	if(not shake_timer.is_stopped()):
		var shake_strength_lerped = lerpf(shake_strength, 0, 1 - (shake_timer.time_left/shake_timer.wait_time))
		offset = Vector2(rng.randf_range(1, shake_strength_lerped), rng.randf_range(1, shake_strength_lerped))

func shake_camera(time: float, strength: float):
	shake_timer.wait_time = time
	shake_strength = strength
	shake_timer.start()

func _on_shake_timer_timeout():
	offset = Vector2.ZERO
