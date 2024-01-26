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

func _ready():
	berking = false
	berk_value = 0

func _process(_delta):
	$Flip.scale.x = facing if facing != NEUTRAL else facing
	if(berk_value >= 100 and !berking):
		berking = true
		Game.emit_signal("go_berk")
		$Flip/Hitbox.damage = 2

func enable_movement():
	var state : State = $StateMachine.current_state
	state.emit_signal("transition", "Movement")

func _physics_process(_delta):
	move_and_slide()
