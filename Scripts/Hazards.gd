extends Area2D

func _on_Hazard_body_entered(body):
	Global.GameState.hurt()

