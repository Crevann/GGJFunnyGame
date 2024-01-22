extends Node
class_name State

var enabled: bool

signal transition(state: State)

func state_process(_delta: float):
	pass
	
func state_physics_process(_delta: float):
	pass
	
func state_enter():
	pass

func state_exit():
	pass
