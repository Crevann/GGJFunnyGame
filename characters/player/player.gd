extends CharacterBody2D
class_name Player

enum {LEFT = -1, NEUTRAL = 0, RIGHT = 1}

const SPEED = 600.0
const DECELLARATION = 0.2

var facing := RIGHT

func _physics_process(delta):
	move_and_slide()
