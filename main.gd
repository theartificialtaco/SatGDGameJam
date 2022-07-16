extends Node2D

var location = ""
var destination = ""

func to_overworld():
	destination = "overworld"
	get_node(str(location)).queue_free()
	$overworld_timer.start()

func set_location(name):
	location = name

func to_room(name):
	destination = name
	get_node(str(location)).queue_free()
	$everywhere_else_timer.start()

func to_legendary():
	destination = "legendary-room"
	get_node(str(location)).queue_free()
	$everywhere_else_timer.start()

func to_cave():
	destination = "cave"
	get_node(str(location)).queue_free()
	$everywhere_else_timer.start()

func _on_overworld_timer_timeout():
	add_child(load("res://overworld.tscn").instance())
	get_node("overworld/player").position = get_node("overworld/portals/" + str(location)).position

func _on_everywhere_else_timer_timeout():
	add_child(load("res://"+str(destination)+".tscn").instance())
	if destination == "house":
		get_node("house/player").position = get_node("house/overworld").position
	if destination == "cave" and location == "legendary-room":
		get_node("cave/player").position = get_node("cave/legendary").position
