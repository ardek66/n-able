extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scn_drum = load("res://entities/Drum.tscn")
var scn_parcare = load("res://entities/Parcare.tscn")
var scn_stalp = load("res://entities/Stalp.tscn")
onready var http_client = get_node("/root/Root/APIClient")
var scn_gps = load("res://entities/GPS.tscn")

var matrice =  [[-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2],
	[-2, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,-2],
	[-2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-2],
	[-2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-2],
	[-2, 1, 0, 0, 1,-2, 1, 0, 0, 0, 0, 1,-2, 1, 0, 0, 1,-2],
	[-2, 1, 0, 0, 1,-2, 1, 0, 0, 0, 0, 1,-2, 1, 0, 0, 1,-2],
	[-2, 1, 0, 0, 1,-2, 1, 0, 0, 0, 0, 1,-2, 1, 0, 0, 1,-2],
	[-2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-2],
	[-2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-2],
	[-2, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,-2],
	[-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2]]

# Called when the node enters the scene tree for the first time.
func _ready():
	http_client.connect("request_completed", self, "_raspuns_drum")
	
	var drum = scn_drum.instance()
	drum.set_position(Vector2(200,200))
	add_child(drum)

	var stalp = scn_stalp.instance()
	stalp.set_position(Vector2(290,334))
	stalp.set_rotation_degrees(90)
	add_child(stalp)
	
	var stalp3 = scn_stalp.instance()
	stalp3.set_position(Vector2(290,334-96))
	stalp3.set_rotation_degrees(90)
	add_child(stalp3)

	var stalp2 = scn_stalp.instance()
	stalp2.set_position(Vector2(12*64-32,334))
	stalp2.set_rotation_degrees(90)
	add_child(stalp2)
	var stalp4 = scn_stalp.instance()
	stalp4.set_position(Vector2(12*64-32,334-96))
	stalp4.set_rotation_degrees(90)
	add_child(stalp4)
	
	for i in range(1,4,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(64*5+16,i*64+136),0)
		add_child(parcare)
		
	for i in range(1,4,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(64*4-16,i*64+184),2)
		add_child(parcare)
		
	for i in range(1,4,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(64*12+8,i*64+136),0)
		add_child(parcare)
		
	for i in range(1,4,1):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(64*11-8, i*64+184),2)
		add_child(parcare)

	for i in range(9):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(0,64*i + 8),0)
		add_child(parcare) 
		
	for i in range(9):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(1022,54+64*i),2)
		add_child(parcare) 
		
	for i in range(10):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(250+64*i,0),1)
		add_child(parcare) 
		
	for i in range(10):
		var parcare = scn_parcare.instance()
		parcare.init(Vector2(200+64*i,575),3)
		add_child(parcare) 
		
	for child in get_children():
		var zona_parcare = child.get_node_or_null("ParcareArea")
		if((zona_parcare) and (child.parcat)):
			var coords = world_to_map(to_local(child.position))
			# set_cell(coords.x, coords.y, 1)
			matrice[coords.y+1][coords.x+1] = -1

	for masina in get_node("/root/Root/Masini").get_children():
		var coords = world_to_map(to_local(masina.position))
		matrice[coords.y+1][coords.x+1] = 2
		
	get_node("/root/Root/APIClient").request_drum(matrice)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _raspuns_drum(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	for drum in json.result:
		var coord = drum.Order[-1]
		var new_coord = Vector2(coord[1]*64-64, coord[0]*64-64)
		var gps = scn_gps.instance()
		gps.set_position(new_coord)
		
		add_child(gps)
