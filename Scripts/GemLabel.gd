extends Label

var gems  = 0

func _ready():
	text = str(gems)


func _on_blueGem_gem_grabbed():
	 gems = gems + 1
	 _ready()