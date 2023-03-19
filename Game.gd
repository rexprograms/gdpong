extends Node2D

onready var BallContainer = $BallContainer
onready var BallSpawn = $BallContainer/BallSpawn
onready var ScoreLabel = $Graphics/ScoreLabel

var Ball = preload("res://Ball/Ball.tscn")
var score = Vector2.ZERO

func _ready():
	spawnBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawnBall():
	var ball = Ball.instance()
	BallContainer.add_child(ball)
	ball.global_position = BallSpawn.global_position
	
func ball_exited_left(ball):
	score.y+=1
	update_score()
	ball.queue_free()
	spawnBall()
		
func ball_exited_right(ball):
	score.x+=1
	update_score()
	ball.queue_free()
	spawnBall()


func update_score():
	ScoreLabel.text = "%d   %d" % [score.x, score.y]
