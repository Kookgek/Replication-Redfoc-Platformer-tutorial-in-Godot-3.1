extends Area2D

signal heart_loss

func _on_body_entered(body: PhysicsBody2D):
	get_node("../../Player/AnimationPlayer").play("enemy");
	emit_signal("heart_loss")