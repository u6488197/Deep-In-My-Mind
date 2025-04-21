extends Control

var first_click = false

func _ready():
	$planner_click.stop()
	Dialogic.signal_event.connect(DialogicSignal)
	Dialogic.timeline_started.connect(on_timeline_started)
	Dialogic.timeline_ended.connect(on_timeline_ended)
	# Dialogic.start("i14-1")
	
## Hide the phone button when it is not in the drawer scene
func _process(_delta):
	if get_tree().root.has_node("SceneManager/PhonePasscodeScene") or get_tree().root.has_node("SceneManager/PlannerScene"):
		%phone.hide()

## Go to planner
func _on_planner_pressed():
	$planner_click.play()
	%planner.hide()
	SceneManager.remove_node()
	SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/planner_scene.tscn")

## If the palyer first enters and does not input any passcode, show the dialogue before going to unlock passcode game.
func _on_phone_pressed():
	%phone.hide()
	if GlobalGameState.password_count > 0:
		if get_tree().root.has_node("SceneManager/PhonePasscodeScene"):
			get_tree().root.get_node("SceneManager/PhonePasscodeScene")
		else :
			SceneManager.remove_node()
			SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/phone_passcode_scene.tscn")
			
		#print(GlobalGameState.password_count)
	else: 
		if first_click == true:
			pass
		else:
			Dialogic.start("i14-1")
			
	## If successfully unlock the phone, start the dialogue.
	if GlobalGameState.password == true :
		SceneManager.remove_node()
		SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/phone_scene.tscn")

## If the argument is clues, go to unlock passcode scene.
func DialogicSignal(argument:String):
	if argument == "clues" :
		first_click = true
		SceneManager.remove_node()
		SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/phone_passcode_scene.tscn")

## Hide phone and planner button when the dialogue is started
func on_timeline_started():
	%phone.hide()
	%planner.hide()

## Show phone and planner button when the dialogue is ended
func on_timeline_ended():
	%phone.show()
	%planner.show()
