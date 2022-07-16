extends Area2D

func _on_to_overworld_area_entered(area):
	if area.name == "player":
		get_tree().call_group("main","to_overworld")
