extends Sprite2D

@export var chance: int

func random_appear():
	var chance_number = randi_range(0, chance)
	print(chance_number)
	if(chance_number == chance):
		print("appear!!")
		visible = true
	else:
		visible = false
