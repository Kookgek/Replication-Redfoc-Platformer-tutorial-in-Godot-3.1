extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -565

var motion = Vector2()

func _physics_process(delta):
				
	motion.y += GRAVITY
	var friction = false
	
	if  $"../HUD/HUD/StatsHud/HeartLabel".hearts > 0:
			
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED) 
			$Sprite.flip_h = false
			$Sprite.play("Run")
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED) 
			$Sprite.play("Run")
			$Sprite.flip_h = true
		else:
			$Sprite.play("Idle") 
			friction = true
		
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
		else:
			if motion.y < 0:
				$Sprite.play("Jump")	
			else:
				$Sprite.play("Fall")	
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)	
				
		motion = move_and_slide(motion, UP)
		
	else:
		$Sprite.play("Dead")
				


func _on_VisibilityNotifier2D_screen_exited():
	get_node("../HUD/HUD").reset()

