extends CharacterBody2D
class_name Player

enum {LEFT = -1, NEUTRAL = 0, RIGHT = 1}

const SPEED = 475.0
const SPEED_BERK = 700.0
const DECELLARATION = 0.2
const DASH_SPEED = 1800.0

var facing := RIGHT
var berk_value = 0 #max 100

func _physics_process(_delta):
	move_and_slide()
