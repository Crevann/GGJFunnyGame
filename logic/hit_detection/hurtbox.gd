extends Area2D
class_name Hurtbox

signal hit(other: Hitbox)

func _ready():
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	emit_signal("hit", area)
