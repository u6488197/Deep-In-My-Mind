extends Area2D

func _ready():
	
	$interactObject.hide()
	Dialogic.signal_event.connect(DialogicSignal)

func _on_body_entered(_body):
	$interactObject.show()

func _on_body_exited(_body):
	$interactObject.hide()


## If the player collects 5 papers and finishes dragging and dropping them, drawer is opened.
## If the player collects 5 papers and has not finished dragging and dropping them, the dialogue for incomplete drag and drop starts.
## If the palyer has not collected all 5 papers, the drawer is locked.
func _on_interact_object_pressed():
	%background.stop()
	$interactObject.hide()
	#print(GlobalGameState.drag_and_drop)
	
	if GlobalPaperCounter.counter == 5 and GlobalGameState.drag_and_drop == false:
		Dialogic.start("complete_papers")
	elif GlobalPaperCounter.counter == 5 and GlobalGameState.drag_and_drop == true:
		SceneManager.remove_node()
		SceneManager.add_node("res://parallax_gameplay/2nd_floor/scene/click_full_password.tscn")
	else :
		Dialogic.start("require_complete_papers")
	
	## Go to drawer scene when already unlock the key	
	if GlobalGameState.lock == true:
		SceneManager.remove_node()
		SceneManager.add_node("res://find_a_password/scene/canvaslayer_scene/main.tscn")
	 
## Go to drawer scene when already unlock the key	
func DialogicSignal(argument: String):
	if argument == "unlock_complete":
		GlobalGameState.lock = true
		SceneManager.remove_node()
		SceneManager.add_node("res://find_a_password/scene/canvaslayer_scene/main.tscn")
		
