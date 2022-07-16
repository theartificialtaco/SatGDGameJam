extends Area2D

onready var ray = $RayCast2D

var gridsize = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT}

func _ready():
	get_tree().call_group("main", "set_location", get_parent().name)

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var vectorpos = inputs[dir] * gridsize
	ray.cast_to = vectorpos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vectorpos

func to_room(area):
	if area.name != "to_overworld":
		if area.name == "house" or area.name == "lab" or area.name == "tower" or area.name == "gym" or area.name == "pokemon-center" or area.name == "pokemon-league" or area.name == "cave":
			get_tree().call_group("main","to_room", area.name)

func _on_legendaryroom_area_entered(area):
	if area.name == "player":
		get_tree().call_group("main","to_legendary")

func _on_tocave_area_entered(area):
	if area.name == "player":
		get_tree().call_group("main","to_cave")
