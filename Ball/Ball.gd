extends Area2D

class_name Ball

var speed = 100
var direction = Vector2.LEFT

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass

func _physics_process(delta):
	speed = speed + delta * 5
	global_position += speed * direction * delta
