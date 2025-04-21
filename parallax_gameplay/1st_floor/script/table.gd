extends Area2D

## Interact with table(i2)

func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()

## When a player enters within the area, show the icon. 
func _on_body_entered(_body):
	if $interactObject:
		$interactObject.show()	

## When a player is not within the area, show the icon. 
func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()
		
func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
	## Play the dialogue
	Dialogic.start("i2_dialogue")
