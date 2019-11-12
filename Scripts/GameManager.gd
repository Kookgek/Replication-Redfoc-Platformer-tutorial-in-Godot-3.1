extends Control

signal reset

func _ready():
	$"Label".hide()

func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ESCAPE:
            get_tree().quit()


func reset():
	var delay = 3
	$"StatsHud".hide()
	$"../../Enemies".hide()
	$"../../Collectibles/Gems".hide()
	yield(get_tree().create_timer(1), "timeout")
	$"Label".show()
	yield(get_tree().create_timer(delay), "timeout")
	get_tree().reload_current_scene()
	emit_signal("reset")	