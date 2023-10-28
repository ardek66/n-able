extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scn_drum = load("res://entities/Drum.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var drum = scn_drum.instance()
	drum.set_position(Vector2(200,200))
	add_child(drum)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
