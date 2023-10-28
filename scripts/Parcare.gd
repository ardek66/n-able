extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var masina_scn = load("res://entities/Masina.tscn")
var parcat = false
const PROBABILITATE = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	var chance = rand_range(0, 1)
	if chance <= PROBABILITATE:
		var masina = masina_scn.instance()
		add_child(masina)
		parcat = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func init(pos,state):
	
	set_position(pos)
	if state == 1:
		set_rotation_degrees(90)
	elif state == 2:
		set_rotation_degrees(180)
	elif state == 3:
		set_rotation_degrees(270)
	else:
		set_rotation_degrees(0)
	pass
	
