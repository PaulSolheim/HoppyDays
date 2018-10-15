extends Node

var GameState
var Player
var GUI

# Scene locations - MUST be set MANUALLY
var GameOver = "res://Scenes/Levels/GameOver.tscn"
var Victory = "res://Scenes/Levels/Victory.tscn"
var Lightning = ""
var Levels = []

func _ready():
	Levels.append("res://Scenes/Levels/Level1.tscn")
	Levels.append("res://Scenes/Levels/Level2.tscn")
	