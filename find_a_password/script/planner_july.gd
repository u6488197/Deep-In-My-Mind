extends Control

var end = false
var node: CanvasLayer

func _ready():
	$planner_click.play()
	Dialogic.start("calendar")
	Dialogic.signal_event.connect(DialogicSignal)
	%goBack.hide()

## Navigate to drawer scene if the dialogue is ended
func _on_go_back_pressed():
	if end:
		SceneManager.remove_node()
		SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/main.tscn")

func DialogicSignal(argument:String):
	if argument == "calendar" :
		end = true
		Dialogic.Voice.pause()
		%goBack.show()

	


