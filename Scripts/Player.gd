extends KinematicBody2D

const SPEED = 750

var motion = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	move_and_slide(motion)
	