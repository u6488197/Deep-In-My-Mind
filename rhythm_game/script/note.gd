extends Area2D

## @template : https://github.com/LegionGames/Conductor-Example/
const TARGET_Y = 650
const SPAWN_Y = 50
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

## The position where the note for each lane will fall
const LEFT_LANE_SPAWN = Vector2(400, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(550, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(700, SPAWN_Y)
const DOWN_LANE_SPAWN = Vector2(850, SPAWN_Y)

var speed = -150

var hit = false


func _ready():
	pass

## Note will disappear when it is go out of the frame if it is not pressed.
func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 700:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta


func initialize(lane):
	if lane == 0:
		$AnimatedSprite2D.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite2D.frame = 1
		position = CENTRE_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite2D.frame = 3
		position = RIGHT_LANE_SPAWN
	elif lane == 3:
		$AnimatedSprite2D.frame = 2
		position = DOWN_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0


func destroy(score):
	$AnimatedSprite2D.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "GREAT"
		$Node2D/Label.modulate = Color("ffffff")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("ffffff")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("ffffff")


func _on_Timer_timeout():
	queue_free()
