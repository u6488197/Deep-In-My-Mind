extends Area2D

## Interact with paper at scene 4
var player: bool = false

## Hide and show at start
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()

	## Connect the DialogicSignal function
	Dialogic.signal_event.connect(DialogicSignal)

## If the paper is already collected, hide the interaction button.
func _process(_delta):
	if GlobalDialogueState.p1_scene4_dialogue_end == true :
		hide_interaction()
	
	elif GlobalDialogueState.p2_scene4_dialogue_end == true:
		hide_interaction()
		
	elif GlobalDialogueState.p3_scene4_dialogue_end == true:
		hide_interaction()
		
	elif GlobalDialogueState.p4_scene4_dialogue_end == true:
		hide_interaction()
		
	elif GlobalDialogueState.p5_scene4_dialogue_end == true:
		hide_interaction()
	

## When a player enters within the area, show the icon 
## If the paper is already collected, hide the interaction button.
func _on_body_entered(_body):
	if GlobalDialogueState.p1_scene4_dialogue_end == true :
		$interactObject.hide()
		
	elif GlobalDialogueState.p2_scene4_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.p3_scene4_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.p4_scene4_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.p5_scene4_dialogue_end == true:
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
	if GlobalPaperCounter.counter == 0 and GlobalDialogueState.p1_scene4_dialogue_end == false:
			Dialogic.VAR.paper_1_st_floor_scene4 = 1
			Dialogic.start("scene4_dialogue")
			
	elif GlobalPaperCounter.counter == 1 and GlobalDialogueState.p1_scene4_dialogue_end == false and GlobalDialogueState.p2_scene4_dialogue_end == false:
			Dialogic.VAR.paper_1_st_floor_scene4 = 2
			Dialogic.start("scene4_dialogue")
			
	elif GlobalPaperCounter.counter == 2 and GlobalDialogueState.p1_scene4_dialogue_end == false and GlobalDialogueState.p2_scene4_dialogue_end == false and GlobalDialogueState.p3_scene4_dialogue_end == false:
			Dialogic.VAR.paper_1_st_floor_scene4 = 3
			Dialogic.start("scene4_dialogue")
		
	elif GlobalPaperCounter.counter == 3 and GlobalDialogueState.p1_scene4_dialogue_end == false and GlobalDialogueState.p2_scene4_dialogue_end == false and GlobalDialogueState.p3_scene4_dialogue_end == false and GlobalDialogueState.p4_scene4_dialogue_end == false: 
			Dialogic.VAR.paper_1_st_floor_scene4 = 4
			Dialogic.start("scene4_dialogue")
	
	elif GlobalPaperCounter.counter == 4 and GlobalDialogueState.p1_scene4_dialogue_end == false and GlobalDialogueState.p2_scene4_dialogue_end == false and GlobalDialogueState.p3_scene4_dialogue_end == false and GlobalDialogueState.p4_scene4_dialogue_end == false and GlobalDialogueState.p5_scene4_dialogue_end == false:
			Dialogic.VAR.paper_1_st_floor_scene4 = 5
			Dialogic.start("scene4_dialogue")
			
func hide_interaction():
	$p3.hide()
	$interactObject.hide()

## Receive signal from dialogue
## To ensure dialogue is ended 
func DialogicSignal(argument: String):
	## After collecting the paper at scene 4
	if GlobalPaperCounter.counter == 1:
		if argument == "p1_scene4_end":
			GlobalDialogueState.p1_scene4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene4)
			
	elif GlobalPaperCounter.counter == 2:
		if argument == "p2_scene4_end":
			GlobalDialogueState.p2_scene4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene4)
			
	elif GlobalPaperCounter.counter == 3:
		if argument == "p3_scene4_end":
			GlobalDialogueState.p3_scene4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene4)
			
	elif GlobalPaperCounter.counter == 4:
		if argument == "p4_scene4_end":
			GlobalDialogueState.p4_scene4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene4)
			
	elif GlobalPaperCounter.counter == 5:
		if argument == "p5_scene4_end":
			GlobalDialogueState.p5_scene4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_1_st_floor_scene4)
			
func check_paper_sequence(sequence:int):
	GlobalDialogueState.paper_1_st_floor_scene4 = sequence
	print("paper_1_st_floor_scene4: " + str(GlobalDialogueState.paper_1_st_floor_scene4))


