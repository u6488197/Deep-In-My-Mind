extends Area2D


## Interact with paper
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()

	## Connect the DialogicSignal function
	Dialogic.signal_event.connect(DialogicSignal)

## If the paper is already collected, hide the interaction button.
func _process(_delta):
	if GlobalDialogueState.table_p1_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p2_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p3_dialogue_end == true:
		hide_interaction()	
	elif GlobalDialogueState.table_p4_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p5_dialogue_end == true:
		hide_interaction()
		
func hide_interaction():
	$Paper.hide()
	$interactObject.hide()

## If the paper is already collected, hide the interaction button.
func _on_body_entered(_body):
	if GlobalDialogueState.table_p1_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p2_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p3_dialogue_end == true:
		hide_interaction()	
	elif GlobalDialogueState.table_p4_dialogue_end == true:
		hide_interaction()
	elif GlobalDialogueState.table_p5_dialogue_end == true:
		hide_interaction()
	else :
		$interactObject.show()
		
func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()

func _on_interact_object_pressed():
	#print(connect)
	%click.play()
	$interactObject.hide()
	## Check whether default dialogue is ended or not
	if GlobalPaperCounter.counter == 0 and GlobalDialogueState.table_p1_dialogue_end == false:
		Dialogic.VAR.paper_2_nd_floor_scene3 = 1
		Dialogic.start("2_nd_floor_scene3_dialogue")
	
	elif GlobalPaperCounter.counter == 1 and GlobalDialogueState.table_p2_dialogue_end == false and GlobalDialogueState.table_p1_dialogue_end == false :
		Dialogic.VAR.paper_2_nd_floor_scene3 = 2
		Dialogic.start("2_nd_floor_scene3_dialogue")
		
	elif GlobalPaperCounter.counter == 2 and GlobalDialogueState.table_p3_dialogue_end == false and GlobalDialogueState.table_p2_dialogue_end == false and GlobalDialogueState.table_p1_dialogue_end == false :
		Dialogic.VAR.paper_2_nd_floor_scene3 = 3
		Dialogic.start("2_nd_floor_scene3_dialogue")
			
	elif GlobalPaperCounter.counter == 3 and GlobalDialogueState.table_p4_dialogue_end == false and GlobalDialogueState.table_p3_dialogue_end == false and GlobalDialogueState.table_p2_dialogue_end == false and GlobalDialogueState.table_p1_dialogue_end == false :
		Dialogic.VAR.paper_2_nd_floor_scene3 = 4
		Dialogic.start("2_nd_floor_scene3_dialogue")
		
	elif GlobalPaperCounter.counter == 4 and GlobalDialogueState.table_p5_dialogue_end == false and GlobalDialogueState.table_p4_dialogue_end == false and GlobalDialogueState.table_p3_dialogue_end == false and GlobalDialogueState.table_p2_dialogue_end == false and GlobalDialogueState.table_p1_dialogue_end == false:
			Dialogic.VAR.paper_2_nd_floor_scene3 = 5
			Dialogic.start("2_nd_floor_scene3_dialogue")
			
			
## Receive signal from dialogue
## To ensure dialogue is ended 
func DialogicSignal(argument: String):

	if GlobalPaperCounter.counter == 1:
		if argument == "table_p1_end":
			GlobalDialogueState.table_p1_dialogue_end = true
			GlobalDialogueState.table_status = true
			check_paper_sequence(Dialogic.VAR.paper_2_nd_floor_scene3)
			
	elif GlobalPaperCounter.counter == 2:
		if argument == "table_p2_end":
			GlobalDialogueState.table_p2_dialogue_end = true
			GlobalDialogueState.table_status = true
			check_paper_sequence(Dialogic.VAR.paper_2_nd_floor_scene3)
			
	elif GlobalPaperCounter.counter == 3:
		if argument == "table_p3_end":
			GlobalDialogueState.table_p3_dialogue_end = true
			GlobalDialogueState.table_status = true
			check_paper_sequence(Dialogic.VAR.paper_2_nd_floor_scene3)
			
	elif GlobalPaperCounter.counter == 4:
		if argument == "table_p4_end":
			GlobalDialogueState.table_p4_dialogue_end = true
			GlobalDialogueState.table_status = true
			check_paper_sequence(Dialogic.VAR.paper_2_nd_floor_scene3)
			
	elif GlobalPaperCounter.counter == 5:
		if argument == "table_p5_end":
			GlobalDialogueState.table_p5_dialogue_end = true
			GlobalDialogueState.table_status = true
			check_paper_sequence(Dialogic.VAR.paper_2_nd_floor_scene3)
		
	# print(GlobalDialogueState.table_status)

func check_paper_sequence(sequence:int):
	GlobalDialogueState.paper_2_nd_floor_scene3 = sequence
	print("paper_2_nd_floor_scene3: " + str(GlobalDialogueState.paper_2_nd_floor_scene3))
