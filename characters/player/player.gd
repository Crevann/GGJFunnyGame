extends CharacterBody2D
class_name Player

enum {LEFT = -1, NEUTRAL = 0, RIGHT = 1}

const SPEED = 475.0
const SPEED_BERK = 700.0
const FRICTION = 0.2
const DASH_SPEED = 1800.0

var facing := RIGHT
var combo_increased: bool
var berking : bool
var berk_value = 0 #max 100

@onready var berk_sfxs = [
	load("res://sfx/crowd_laugh1.ogg"),
	load("res://sfx/crowd_laugh2.ogg"),
	load("res://sfx/crowd_laugh3.ogg")
]

func _ready():
	berking = false
	berk_value = 0
	Game.connect("finish", end_game)

func _process(_delta):
	$Flip.scale.x = facing if facing != NEUTRAL else facing
	if(berk_value >= 100 and !berking):
		berking = true
		Game.emit_signal("go_berk")
		$Flip/Hitbox.damage = 2
		$BerkStartSFX.play()
		$BerkLaughterSFX.stream = berk_sfxs[randi_range(0, berk_sfxs.size() - 1)]
		$BerkLaughterSFX.play()

func enable_movement():
	var state : State = $StateMachine.current_state
	state.emit_signal("transition", "Movement")

func end_game():
	berk_value = 0
	berking = false
	var state : State = $StateMachine.current_state
	velocity = Vector2.ZERO
	$AnimationPlayer.play("Idle")
	state.emit_signal("transition", "Cutscene")

func _physics_process(_delta):
	move_and_slide()

func _on_berk_laughter_sfx_finished():
	$BerkLaughterSFX.stream = berk_sfxs[randi_range(0, berk_sfxs.size() - 1)]
	$BerkLaughterSFX.play()
