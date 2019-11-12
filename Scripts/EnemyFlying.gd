extends "res://Scripts/Enemy.gd"

var RotateSpeed = 1.5
var Radius = 80
var _centre
var _angle = 0

func _ready():
    set_process(true)
    _centre = self.get_position()
	
	
func _process(delta): 
     _angle += RotateSpeed * delta;
	 
     var offset = Vector2(cos(_angle +200), cos(_angle -200)) * Radius;
     var pos = _centre + offset
     self.set_position(pos) 