extends Area2D



func _ready():
	%click.stop()
	$stairsInteraction.hide()
	
## Go to the 2nd floor
func _on_stairs_interaction_pressed():
	%click.play()
	$stairsInteraction .hide()
	GlobalDirection.player_direction = 1
	SceneManager.remove_node()
	SceneManager.add_node("res://parallax_gameplay/2nd_floor/scene/2nd_floor.tscn")

## Only show the button when the paper counter is more than 3
func _on_body_entered(_body):
	if GlobalPaperCounter.counter >= 3:
		$stairsInteraction.show()
	else :
		$stairsInteraction.hide()

func _on_body_exited(_body: CharacterBody2D):
	$stairsInteraction.hide()

