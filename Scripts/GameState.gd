extends Node

export var starting_lives = 3
export var coin_target = 10

var lives
var coins = 0
var level = 0

func _ready():
	Global.GameState = self
	start_game()

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
	Global.GUI.update_GUI(coins, lives)

func animate_GUI(animation):
	Global.GUI.animate(animation)

func start_game():
	lives = starting_lives
	coins = 0
	level = 0
	get_tree().change_scene(Global.Levels[level])

func next_level():
	level += 1
	if (level >= Global.Levels.size()):
		victory()
	else:
		get_tree().change_scene(Global.Levels[level])

func end_game():
	get_tree().change_scene(Global.GameOver)

func victory():
	get_tree().change_scene(Global.Victory)
