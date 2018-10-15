extends Node2D

func _ready():
	Global.GameState.update_GUI()

func _on_Portal_body_entered(body):
	Global.GameState.life_up()
	Global.GameState.next_level()
