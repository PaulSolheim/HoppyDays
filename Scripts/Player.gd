extends KinematicBody2D

export var world_limit = 3000

const SPEED = 750
const GRAVITY = 3600
const JUMP_SPEED = -1800
const JUMP_BOOST = 2
const UP = Vector2(0,-1)

var motion = Vector2()

func _ready():
	Global.Player = self
	
func _physics_process(delta):
	update_motion(delta)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func _process(delta):
	animate()

func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x > 0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif motion.x < 0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
	if position.y > world_limit:
		Global.GameState.end_game()
	
	motion.y = clamp(motion.y,(JUMP_SPEED * JUMP_BOOST), -JUMP_SPEED)

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		$Jump_SFX.play()

func hurt():
	motion.y = JUMP_SPEED
	$Pain_SFX.play()

func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST






