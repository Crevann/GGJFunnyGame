extends Control

@export var combo_colors = []
@export var combo_scales = []
@export var combo_number = []

var score_to_display: int = 0

func _ready():
	$AnimationPlayer.play("Default")
	Game.connect("points_added", show_points)

func _process(delta):
	if(Game.current_combo > 0):
		$Combo.visible = true
		scale = Vector2(combo_scales[Game.current_combo - 1], combo_scales[Game.current_combo - 1])
		modulate = combo_colors[Game.current_combo - 1]
		$Combo.texture = combo_number[Game.current_combo - 1]
	else:
		$Combo.visible = false

func _on_disappear_timer_timeout():
	$Points.visible = false
	score_to_display = 0

func show_points(points):
	$Points/DisappearTimer.start()
	score_to_display += points
	$Points.visible = true
	$Points.text = var_to_str(score_to_display)
