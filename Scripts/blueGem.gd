extends Area2D

signal gem_grabbed


func _on_blueGem_body_entered(body):
	if body.name == "Player":
        emit_signal("gem_grabbed")
	
	queue_free()	

