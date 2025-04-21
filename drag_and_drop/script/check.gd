extends Node2D


## If drag and drop game is complete, start the dialogue.
func _ready():
	if GlobalGameState.drag_and_drop == true :
		Dialogic.start("successful_paperassembly")

