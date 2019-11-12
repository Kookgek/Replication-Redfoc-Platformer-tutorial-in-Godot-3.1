extends Label

var hearts = 5

func _ready():
	text = str(hearts)
	
	if hearts <= 0:
		get_node("../..").reset()


func _on_Enemy_heart_loss():
	hearts = hearts - 1
	_ready()