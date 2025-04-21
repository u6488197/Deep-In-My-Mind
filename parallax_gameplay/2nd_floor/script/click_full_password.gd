extends CanvasLayer


func _ready():
	Dialogic.start("key")
	$show.show()
	$TextureRect.hide()
	$goBack.hide()
	Dialogic.signal_event.connect(DialogicSignal)


func _on_show_pressed():
	# print("clicked")
	$TextureRect.show()
	$goBack.show()


func _on_go_back_pressed():
	$TextureRect.hide()
	$goBack.hide()
	
func DialogicSignal(argument: String):
	if argument == "unlock_complete":
		GlobalGameState.lock = true
		get_tree().change_scene_to_file("res://sceneTrees/findApassword/Scene/drawer.tscn")
		



