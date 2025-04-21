extends Area2D

## Interact with box(i10), letter(i11), (i12) and paper

func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	
	## Connect the DialogicSignal function
	Dialogic.signal_event.connect(DialogicSignal)

## If the paper is already collected, hide the interaction button.
func _process(delta):
	
	if GlobalDialogueState.i10_12_p1_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i10_12_p2_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p3_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p4_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p5_dialogue_end == true:
		$interactObject.hide()
		
## If the paper is already collected, hide the interaction button.
func _on_body_entered(_body):
	
	if GlobalDialogueState.i10_12_p1_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i10_12_p2_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p3_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p4_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p5_dialogue_end == true:
		$interactObject.hide()
		
	else :
		$interactObject.show()

func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()
		

func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
	%interactObject.hide()

	## If the paper is already collected, hide the interaction button.
	if GlobalDialogueState.i10_12_p1_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i10_12_p2_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i10_12_p3_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p4_dialogue_end == true:
		$interactObject.hide()
	
	elif GlobalDialogueState.i10_12_p5_dialogue_end == true:
		$interactObject.hide()
	
	# Check whether default dialogue is ended or not
	if GlobalPaperCounter.counter == 0 and GlobalDialogueState.i10_12_p1_dialogue_end == false:
			Dialogic.VAR.i10_i12_paper = 1
			Dialogic.start("i10-i12_dialogue")
	
	elif GlobalPaperCounter.counter == 1 and GlobalDialogueState.i10_12_p2_dialogue_end == false and GlobalDialogueState.i10_12_p1_dialogue_end == false:
			Dialogic.VAR.i10_i12_paper = 2
			Dialogic.start("i10-i12_dialogue")
			
	elif GlobalPaperCounter.counter == 2 and GlobalDialogueState.i10_12_p3_dialogue_end == false and GlobalDialogueState.i10_12_p2_dialogue_end == false and GlobalDialogueState.i10_12_p1_dialogue_end == false:
			Dialogic.VAR.i10_i12_paper = 3
			Dialogic.start("i10-i12_dialogue")
			
	elif GlobalPaperCounter.counter == 3 and GlobalDialogueState.i10_12_p4_dialogue_end == false and GlobalDialogueState.i10_12_p3_dialogue_end == false and GlobalDialogueState.i10_12_p2_dialogue_end == false and GlobalDialogueState.i10_12_p1_dialogue_end == false:
			Dialogic.VAR.i10_i12_paper = 4
			Dialogic.start("i10-i12_dialogue")
			
	elif GlobalPaperCounter.counter == 4 and GlobalDialogueState.i10_12_p5_dialogue_end == false and  GlobalDialogueState.i10_12_p4_dialogue_end == false and GlobalDialogueState.i10_12_p3_dialogue_end == false and GlobalDialogueState.i10_12_p2_dialogue_end == false and GlobalDialogueState.i10_12_p1_dialogue_end == false:
			Dialogic.VAR.i10_i12_paper = 5
			Dialogic.start("i10-i12_dialogue")
	
## Receive signal from dialogue
## To ensure dialogue is ended 
func DialogicSignal(argument: String):
	if GlobalPaperCounter.counter == 1:
		if argument == "i10_12_p1_end":
			GlobalDialogueState.i10_12_p1_dialogue_end = true
			GlobalDialogueState.box_status = true
			check_paper_sequence(Dialogic.VAR.i10_i12_paper)
			
	elif GlobalPaperCounter.counter == 2:
		if argument == "i10_12_p2_end":
			GlobalDialogueState.i10_12_p2_dialogue_end = true
			GlobalDialogueState.box_status = true
			check_paper_sequence(Dialogic.VAR.i10_i12_paper)
			
	elif GlobalPaperCounter.counter == 3:
		if argument == "i10_12_p3_end":
			GlobalDialogueState.box_status = true
			GlobalDialogueState.i10_12_p3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.i10_i12_paper)
			
	elif GlobalPaperCounter.counter == 4:
		if argument == "i10_12_p4_end":
			GlobalDialogueState.i10_12_p4_dialogue_end = true
			GlobalDialogueState.box_status = true
			check_paper_sequence(Dialogic.VAR.i10_i12_paper)
	
	elif GlobalPaperCounter.counter == 5:
		if argument == "i10_12_p5_end":
			GlobalDialogueState.i10_12_p5_dialogue_end = true
			GlobalDialogueState.box_status = true
			check_paper_sequence(Dialogic.VAR.i10_i12_paper)
	
	# print(GlobalDialogueState.box_status)
	
func check_paper_sequence(sequence:int):
		GlobalDialogueState.i10_i12_paper = sequence
		print("i10_i12_paper: " + str(GlobalDialogueState.i10_i12_paper))
