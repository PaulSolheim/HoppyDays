extends Area2D

const SPEED = 500

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	move_down_screen(delta)
	manage_collision()
	
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()

func move_down_screen(delta):
	global_position.y += SPEED * delta

func manage_collision():
	var collider = get_overlapping_bodies()
	for object in collider:
		if object == Global.Player:
			$AnimatedSprite.play("explosion")
			Global.GameState.hurt()
		queue_free()
