extends KinematicBody2D

onready var ray = $RayCast2D
var gridsize = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}

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
