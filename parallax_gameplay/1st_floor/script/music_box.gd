extends Area2D


## Interact with music box(i4) and paper
## Hide and show at start
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	## If the paper is already collected, hide the interaction button.
	if GlobalDialogueState.i4_p1_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p2_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p3_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p4_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p5_dialogue_end == true:
		$interactObject.hide()


## When a player enters within the area, show the icon. 
func _on_body_entered(_body: CharacterBody2D):
	
	## Check whether the player has collected the paper or not
	if GlobalDialogueState.i4_p1_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p2_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p3_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p4_dialogue_end == true:
		$interactObject.hide()
		
	elif GlobalDialogueState.i4_p5_dialogue_end == true:
		$interactObject.hide()
	else:
		$interactObject.show()
	
	
## When a player is not within the area, show the icon. 
func _on_body_exited(_body):
	if $interactObject:
		$interactObject.hide()

func _on_interact_object_pressed():
	%click.play()
	$interactObject.hide()
		
	## Check whether default dialogue is ended or not
	## If not, play the default
	## If yes, set the dialogue_end flag to be true
	if GlobalPaperCounter.counter == 0 and GlobalDialogueState.i4_p1_dialogue_end == false:
		Dialogic.VAR.paper_sequence = 1
		Dialogic.start("i4_dialogue")
	
	elif GlobalPaperCounter.counter == 1 and GlobalDialogueState.i4_p2_dialogue_end == false and GlobalDialogueState.i4_p1_dialogue_end == false:
		Dialogic.VAR.paper_sequence = 2
		Dialogic.start("i4_dialogue")
			
	elif GlobalPaperCounter.counter == 2 and GlobalDialogueState.i4_p3_dialogue_end == false and GlobalDialogueState.i4_p2_dialogue_end == false and GlobalDialogueState.i4_p1_dialogue_end == false:
		Dialogic.VAR.paper_sequence = 3
		Dialogic.start("i4_dialogue")
	
	elif GlobalPaperCounter.counter == 3 and GlobalDialogueState.i4_p4_dialogue_end == false and GlobalDialogueState.i4_p3_dialogue_end == false and GlobalDialogueState.i4_p2_dialogue_end == false and GlobalDialogueState.i4_p1_dialogue_end == false:
		Dialogic.VAR.paper_sequence = 4
		Dialogic.start("i4_dialogue")
			
	elif GlobalPaperCounter.counter == 4 and GlobalDialogueState.i4_p5_dialogue_end == false and GlobalDialogueState.i4_p4_dialogue_end == false and GlobalDialogueState.i4_p3_dialogue_end == false and GlobalDialogueState.i4_p2_dialogue_end == false and GlobalDialogueState.i4_p1_dialogue_end == false:
		Dialogic.VAR.paper_sequence = 4
		Dialogic.VAR.paper_sequence = 5
		Dialogic.start("i4_dialogue")
			
## Receive signal from dialogue
## To ensure dialogue is ended 
func DialogicSignal(argument: String):
	## After collecting the paper at scene 2
	if GlobalPaperCounter.counter == 1:
		if argument == "i4_p1_end":
			GlobalDialogueState.i4_p1_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_sequence)
			
	elif GlobalPaperCounter.counter == 2:
		if argument == "i4_p2_end":
			GlobalDialogueState.i4_p2_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_sequence)
			
	elif GlobalPaperCounter.counter == 3:
		if argument == "i4_p3_end":
			GlobalDialogueState.i4_p3_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_sequence)
			
	elif GlobalPaperCounter.counter == 4:
		if argument == "i4_p4_end":
			GlobalDialogueState.i4_p4_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_sequence)
	
	elif GlobalPaperCounter.counter == 5:
		if argument == "i4_p5_end":
			GlobalDialogueState.i4_p5_dialogue_end = true
			check_paper_sequence(Dialogic.VAR.paper_sequence)


func check_paper_sequence(sequence:int):
		GlobalDialogueState.i4_paper_sequence = sequence
		print("i4: " + str(GlobalDialogueState.i4_paper_sequence))


