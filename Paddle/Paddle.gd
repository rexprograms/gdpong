extends Area2D

onready var sprite = $Sprite

enum PaddleLocation {
	LEFT,
	RIGHT
}

export (PaddleLocation) var paddle_location = PaddleLocation.LEFT

var speed = 150

func _ready():
	pass

func _process(delta):
	var action = "left" if paddle_location == PaddleLocation.LEFT else "right"
	var actionUp = action + "_paddle_up"
	var actionDown = action + "_paddle_down"
	
	if Input.is_action_pressed(actionUp):
		global_position += Vector2.UP * speed * delta
	if Input.is_action_pressed(actionDown):
		global_position += Vector2.DOWN * speed * delta
		
	global_position.y = clamp(global_position.y, 0, 400)

func _on_Paddle_area_entered(area):
	if area is Ball:
		area.direction.x *= -1
		area.direction.y = (area.global_position.y - global_position.y) / 16
