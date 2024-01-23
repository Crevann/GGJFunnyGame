extends State
class_name EnemyState

@onready var enemy : Enemy = $"../.."

#Animation
@export var animation_name : String
@onready var animation : AnimationPlayer = $"../../AnimationPlayer"
	
func state_enter():
	animation.play(animation_name)

func state_physics_process(delta):
	super(delta)
	
