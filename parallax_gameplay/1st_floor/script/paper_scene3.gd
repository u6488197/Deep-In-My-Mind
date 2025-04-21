extends Area2D

## Interact with paper at scene 3

## Hide and show at start
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	## Connect the DialogicSignal function
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	## If the paper is already collected, hide the interaction button.
	if GlobalDialogueState.p1_scene3_dialogue_end == true :
		hide_interaction()
		
	elif GlobalDialogueState.p2_scene3_dialogue_end == true:
		hide_interaction()
		
	elif GlobalDialogueState.p3_scene3_dialogue_end == true:
		hide_interaction()
	
	elif GlobalDialogueState.p4_scene3_dialogue_end == true:
		hide_interaction()
	
	elif GlobalDialogueState.p5_scene3_dialogue_end == true:
		hide_interaction()
	
## If the paper is already collected, hide the interaction button.
func _on_body_entered(_body):
	if GlobalDialogueState.p1_scene3_dialogue_end == true :
		$interactObject.hide()
		
	elif GlobalDialogueState.p2_scene3_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.p3_scene3_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.p4_scene3_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.p5_scene3_dialogue_end == true:
		$interactObject.hide()
		
	else :
		$interactObject.show()
		
## When a player is not within the area, show the icon 
func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()

## Click mouse to play dialogue
func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
	## Check whether it is the first collected paper?
	if GlobalPaperCounter.counter == 0 and GlobalDialogueState.p1_scene3_dialogue_end == false:
		Dialogic.VAR.paper_1_st_floor_scene3 = 1
		Dialogic.start("scene3_dialogue")
			
	elif GlobalPaperCounter.counter == 1 and GlobalDialogueState.p2_scene3_dialogue_end == false and GlobalDialogueState.p1_scene3_dialogue_end == false:
		Dialogic.VAR.paper_1_st_floor_scene3 = 2
		Dialogic.start("scene3_dialogue")	
			
	elif GlobalPaperCounter.counter == 2 and GlobalDialogueState.p3_scene3_dialogue_end == false and GlobalDialogueState.p2_scene3_dialogue_end == false and GlobalDialogueState.p1_scene3_dialogue_end == false:
		Dialogic.VAR.paper_1_st_floor_scene3 = 3
		Dialogic.start("scene3_dialogue")
		
	elif GlobalPaperCounter.counter == 3 and GlobalDialogueState.p4_scene3_dialogue_end == false and GlobalDialogueState.p3_scene3_dialogue_end == false and GlobalDialogueState.p2_scene3_dialogue_end == false and GlobalDialogueState.p1_scene3_dialogue_end == false:
		Dialogic.VAR.paper_1_st_floor_scene3 = 4
		Dialogic.start("scene3_dialogue")
			
	elif GlobalPaperCounter.counter == 4 and GlobalDialogueState.p5_scene3_dialogue_end == false and GlobalDialogueState.p4_scene3_dialogue_end == false and GlobalDialogueState.p3_scene3_dialogue_end == false and GlobalDialogueState.p2_scene3_dialogue_end == false and GlobalDialogueState.p1_scene3_dialogue_end == false:
		Dialogic.VAR.paper_1_st_floor_scene3 = 5
		Dialogic.start("scene3_dialogue")
		
	
func hide_interaction():
	$p2.hide()
	$interactObject.hide()

## Receive signal from dialogue
## To ensure dialogue is ended 
func DialogicSignal(argument: String):

	## After collecting the paper at scene 3
	if GlobalPaperCounter.counter == 1:
		if argument == "p1_scene3_end":
			GlobalDialogueState.p1_scene3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene3)
			
	elif GlobalPaperCounter.counter == 2:
		if argument == "p2_scene3_end":
			GlobalDialogueState.p2_scene3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene3)
			
	elif GlobalPaperCounter.counter == 3:
		if argument == "p3_scene3_end":
			GlobalDialogueState.p3_scene3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene3)
	
	elif GlobalPaperCounter.counter == 4:
		if argument == "p4_scene3_end":
			GlobalDialogueState.p4_scene3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene3)
			
	elif GlobalPaperCounter.counter == 5:
		GlobalDialogueState.p5_scene3_dialogue_end = true
		if argument == "p5_scene3_end":
			GlobalDialogueState.p5_scene3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene3)
			
func check_paper_sequence(sequence:int):
	GlobalDialogueState.paper_1_st_floor_scene3 = sequence
	print("paper_1_st_floor_scene3: " + str(GlobalDialogueState.paper_1_st_floor_scene3))

