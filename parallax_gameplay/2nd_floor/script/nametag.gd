extends Area2D

## Interact with nametag (i8) hanged on the door 

## Hide and show at start
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	if $nametag_i8:
		$nametag_i8.show()

func _on_body_entered(_body):
	if $interactObject:
		$interactObject.show()
		
func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()

func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
	Dialogic.start("i8_dialogue")
