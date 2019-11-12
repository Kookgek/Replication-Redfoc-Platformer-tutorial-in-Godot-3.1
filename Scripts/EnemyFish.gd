extends "res://Scripts/Enemy.gd"

const SPEED = 350.0  

var active = false 

func _physics_process(delta):
	if active:
   	
		var direction = Vector2(-1,0)
		var motion = direction * SPEED * delta
		position += motion


func _on_VisibilityNotifier2D_screen_entered():
		active = true
		
func _on_VisibilityNotifier2D_screen_exited():
		queue_free()