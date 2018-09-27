extends Area2D

func _on_SpikesBottom_body_entered(body):
	Global.GameState.hurt()
