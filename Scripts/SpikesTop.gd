extends Area2D

func _on_SpikesTop_body_entered(body):
	Global.GameState.hurt()
