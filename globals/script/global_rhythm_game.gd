extends Node2D


var score = 0
var combo = 0
var grade = "NA"


signal beat(position)
signal measure(position)

## Evaluate the player's score in the rhythm game
func set_score(new):
	score = new
	if score > 5500:
		grade = "Excellent!"
	elif score > 4000:
		grade = "Great"
	elif score > 2500:
		grade = "Good"
	elif score > 1000:
		grade = "Average"
	else :
		grade = "Try next time"

## Reset all variables
func reset():
	score = 0
	combo = 0
	grade = "NA"
