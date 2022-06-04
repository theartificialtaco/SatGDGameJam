extends KinematicBody2D

var vel = Vector2()
var speed = 2

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		vel.y -= speed
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed
	elif Input.is_action_pressed("ui_left"):
		vel.x -= speed
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
	else:
		vel.x = 0
		vel.y = 0
		
	vel = move_and_slide(vel)
