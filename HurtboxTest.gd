extends Sprite2D


func _on_hurtbox_hit(other: Hitbox):
	print("got " + var_to_str(other.damage) + " damage")
