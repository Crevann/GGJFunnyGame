extends Node
class_name StateMachine

@export var starting_state : State
var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(_on_state_transition)
	
	if(starting_state):
		starting_state.state_enter()
		current_state = starting_state
		current_state.enabled = true
		
func _process(delta):
	current_state.state_process(delta)
	
func _physics_process(delta):
	current_state.state_physics_process(delta)
	
func _on_state_transition(new_state: String):
	if(current_state):
		current_state.enabled = false
		current_state.state_exit()
		
	current_state = states[new_state.to_lower()]
	current_state.enabled = true
	current_state.state_enter()
		
	

