extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(coins, lives):
	$Banner/HBoxContainer/Life/LifeCount.text = str(lives)
	$Banner/HBoxContainer/Coin/CoinCount.text = str(coins)

func animate(animation):
	$AnimationPlayer.play(animation)
