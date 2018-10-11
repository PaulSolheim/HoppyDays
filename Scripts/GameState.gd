extends Node2D

export var starting_lives = 3
export var coin_target = 10

onready var GUI = Global.GUI

var lives
var coins = 0

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()

func coin_up():
	coins += 1
	update_GUI()
	animate_GUI("CoinPulse")
	var multiple_of_coin_target = (coins % coin_target) == 0
	if multiple_of_coin_target:
		life_up()

func life_up():
	lives += 1
	update_GUI()
	animate_GUI("LifePulse")

func hurt():
	lives -= 1
	update_GUI()
	animate_GUI("Hurt")
	Global.Player.hurt()
	if lives < 0:
		end_game()

func update_GUI():
	GUI.update_GUI(coins, lives)

func animate_GUI(animation):
	GUI.animate(animation)

func end_game():
	get_tree().change_scene(Global.GameOver)


func _on_Portal_body_entered(body):
	get_tree().change_scene(Global.Level2)
