extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scn_drum = load("res://entities/Drum.tscn")
var scn_parcare = load("res://entities/Parcare.tscn")
var scn_stalp = load("res://entities/Stalp.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	var drum = scn_drum.instance()
	drum.set_position(Vector2(200,200))
	add_child(drum)

	var stalp = scn_stalp.instance()
	stalp.set_position(Vector2(350,370))
	stalp.set_rotation_degrees(90)
	add_child(stalp)
	
	var stalp3 = scn_stalp.instance()
	stalp3.set_position(Vector2(350,270))
	stalp3.set_rotation_degrees(90)
	add_child(stalp3)

	var stalp2 = scn_stalp.instance()
	stalp2.set_position(Vector2(650,370))
	stalp2.set_rotation_degrees(90)
	add_child(stalp2)
	var stalp4 = scn_stalp.instance()
	stalp4.set_position(Vector2(650,270))
	stalp4.set_rotation_degrees(90)
	add_child(stalp4)
	
	for i in range(1,5,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(370,i*50+170),0)
		add_child(parcare)
		
	for i in range(1,5,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(330,i*50+220),2)
		add_child(parcare)
		
	for i in range(1,5,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(670,i*50+170),0)
		add_child(parcare)
	for i in range(1,5,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(630,i*50+220),2)
		add_child(parcare)

	for i in range(9):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(0,64*i + 26),0)
		add_child(parcare) 
		
	for i in range(9):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(1025,70+64*i),2)
		add_child(parcare) 
		
	for i in range(10):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(250+64*i,0),1)
		add_child(parcare) 
		
	for i in range(10):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(195+64*i,600),3)
		add_child(parcare) 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
