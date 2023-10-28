extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scn_parcare = load("res://entities/Parcare.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var parcare = scn_parcare.instance()
	add_child(parcare) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
