extends CanvasLayer

var first_entry = false

func _ready():
	hide_elements()
	
## If the player first enters to the sofa scene, show the interaction tutorial.	
func _process(_delta):
	if GlobalDirection.first_enter == false:
		hide_elements()
	else:
		$Label.show()
		$Icon.show()
		
func hide_elements():
	$Label.hide()
	$Icon.hide()



