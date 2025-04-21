extends DialogicBackground

var success = false

func _ready():
	$music.stop()
	Dialogic.timeline_started.connect(on_timeline_started)
	Dialogic.timeline_ended.connect(on_timeline_ended)
	Dialogic.signal_event.connect(DialogicSignal)
	
## To check whether the papers are dropped in the correct zone and all of them are already placed on the drop zone.
func _process(_delta):
	if GlobalDragAndDrop.Paper1 == true and GlobalDragAndDrop.Paper2 == true and GlobalDragAndDrop.Paper3 == true and GlobalDragAndDrop.Paper4 == true and GlobalDragAndDrop.Paper5 == true:
		GlobalGameState.drag_and_drop = true
	
		if GlobalGameState.drag_and_drop == true :
			
			$music.stop()
			if GlobalDragAndDrop.dialogue_end == false :
				Dialogic.start("successful_paperassembly")
				Dialogic.VAR.paper_assembly = false
			
			else:
				Dialogic.VAR.paper_assembly = true
				
			GlobalDirection.update_paper_scene(false)
			GlobalDirection.update_come_back(true)
			
		self.call_deferred("free")
		
## Stop the background music when dialogue is started
func on_timeline_started():
	$music.stop()
	
## Play the background music when dialogue is ended
func on_timeline_ended():
	$music.play()


func DialogicSignal(argument:String):
	if argument == "complete" :
		GlobalDragAndDrop.dialogue_end = true
		Dialogic.VAR.paper_assembly = true
			

		
	
