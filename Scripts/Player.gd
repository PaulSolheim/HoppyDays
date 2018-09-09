extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const JUMP_SPEED = -1800
const UP = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	update_motion(delta)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func _process(delta):
	update_animation(motion)

func update_animation(motion):
	$AnimatedSprite.update(motion)

func fall(delta):
	pass

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0

func jump():
	pass
