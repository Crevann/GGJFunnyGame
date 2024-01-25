extends TextureRect

@onready var NORMAL_PORTRAITS = [load("res://logic/ui/ui_sprites/ritratto_normale1.png"), 
load("res://logic/ui/ui_sprites/ritratto_normale2.png"), 
load("res://logic/ui/ui_sprites/ritratto_normale3.png")]
@onready var HALF_INSANE_PORTRAITS = [load("res://logic/ui/ui_sprites/ritratto_mezzo_insano1.png"), 
load("res://logic/ui/ui_sprites/ritratto_mezzo_insano2.png"), 
load("res://logic/ui/ui_sprites/ritratto_mezzo_insano2.png")]
@onready var INSANE_PORTRAITS = [load("res://logic/ui/ui_sprites/ritratto_insano1.png"), 
load("res://logic/ui/ui_sprites/ritratto_insano2.png"), 
load("res://logic/ui/ui_sprites/ritratto_insano3.png")]

var portrait_to_show = 0 # 0 to 2
var rng = RandomNumberGenerator.new()
var shake = 25

@onready var face := $Background/Face
@onready var player: Player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	if(player.berk_value <= 30):
		face.texture = NORMAL_PORTRAITS[portrait_to_show]
	elif(player.berk_value > 30 and player.berk_value <= 60):
		face.texture = HALF_INSANE_PORTRAITS[portrait_to_show]
	elif(player.berk_value > 60 and player.berk_value <= 99):
		face.texture = INSANE_PORTRAITS[portrait_to_show]
	else:
		face.texture = INSANE_PORTRAITS[1]
	
	if(player.berking):
		face.offset_left = randf_range(0, shake)
		face.offset_right = randf_range(0, shake)
	else:
		face.offset_left = 0
		face.offset_right = 0
		

func _on_portrait_change_timer_timeout():
	portrait_to_show = rng.randi_range(0, 2)


func _on_portrait_flip_timer_timeout():
	face.flip_h = !face.flip_h
