extends Area2D

signal ball_exited(ball)
export var bouncy = true

func _ready():
	pass

func _on_Wall_area_entered(area):
	if area is Ball:
		if bouncy:
			area.direction.y *= -1
		else:
			emit_signal("ball_exited", area)
			
