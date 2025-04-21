extends Area2D

## Interact with picture (i9) 

## Hide and show at start
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	if $i9:
		$i9.show()


func _on_body_entered(_body):
	if $interactObject:
		$interactObject.show()

func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()

func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
	Dialogic.start("ev3/ev3-2")
