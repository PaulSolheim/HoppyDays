extends Area2D




func _on_Timer_timeout():
	$AnimatedSprite.play("idle")


func _on_JumpPad_body_entered(body):
	$AnimatedSprite.play("spring")
	$Timer.start()
	Global.Player.boost()
