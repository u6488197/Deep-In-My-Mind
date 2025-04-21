extends Area2D

var first_entry = false
## Interact with sofa(i1)
func _ready():
	%click.stop()
	if $interactObject:
		$interactObject.hide()
	if %Interact_Tutorial_Canvas:
		%Interact_Tutorial_Canvas.hide()
		
	Dialogic.signal_event.connect(DialogicSignal)

func _process(_delta):
	if first_entry:
		%Interact_Tutorial_Canvas.hide()
	
## When a player is not within the area, show the icon 
func _on_body_entered(_body):
	if $interactObject:
		$interactObject.show()
	
	if %Interact_Tutorial_Canvas:
		%Interact_Tutorial_Canvas.show()
	
	await try_await()
	GlobalDirection.first_enter = false

## @tutorial: https://gdscript.com/solutions/coroutines-and-yield/
func try_await():
	await get_tree().create_timer(1).timeout
	
func _on_body_exited(_body):
	#GlobalDirection.first_enter = true
	if $interactObject:
		$interactObject.hide()
	
	if %Interact_Tutorial_Canvas:
		%Interact_Tutorial_Canvas.hide()
	
func _on_interact_object_pressed():
	%click.play()
	%interactObject.hide()
	## Check it before calling
	if %Interact_Tutorial_Canvas:
		%Interact_Tutorial_Canvas.hide()
		
	## Play the dialogue
	Dialogic.start("i1_dialogue") 

func DialogicSignal(argument:String):
	if argument == "tutorial":
		#remove_child(%Interact_Tutorial_Canvas)
		first_entry = true
		print("end")



