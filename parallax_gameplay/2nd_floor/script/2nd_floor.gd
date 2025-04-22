extends Node2D

@onready var drag_and_drop = load("res://drag_and_drop/scene/drag_and_drop_main.tscn").instantiate()

func _ready():
	
	%background.play()
	add_child(drag_and_drop)
	drag_and_drop.set_visible(false)
	
	GlobalDirection.update_scene("2nd_floor")
	print(GlobalDirection.current_scene)
	
	Dialogic.timeline_started.connect(on_timeline_started)
	Dialogic.timeline_ended.connect(on_timeline_ended)
	
		
func _process(_delta):
	#GlobalPaperCounter.counter = 5
	GlobalDirection.update_scene("2nd_floor")
	
	## Hide paper counter during drag and drop game
	if GlobalGameState.drag_and_drop == true:
		%paper.set_visible(false)
		%paperCounter_canvas.set_visible(false)
		GlobalDragAndDrop.dialogue_end = true
		Dialogic.VAR.paper_assembly = true
	
	## If the player collects 5 papers and has not completed drag and drop game, the paper cannot be clicked/disable
	if  GlobalGameState.drag_and_drop == false and GlobalPaperCounter.counter == 5:
		%paper.disabled = false
	else :
		%paper.disabled = true
	
	
## If counter = 5 and drag and drop has not started yet and not completed, go to drag and drop.
func _on_paper_pressed():
	$background.stop()
	%paper.set_visible(false)
	%paperCounter_canvas.set_visible(false)
	GlobalDirection.update_paper_scene(true)
	GlobalDirection.update_player_position($Player.global_position.x, $Player.global_position.y )
	if GlobalPaperCounter.counter == 5 and GlobalDragAndDrop.Paper1 == false and GlobalDragAndDrop.Paper2 == false and GlobalDragAndDrop.Paper3 == false and GlobalDragAndDrop.Paper4 == false and GlobalDragAndDrop.Paper5 == false:
		$Player.position = Vector2(-15,0)
		drag_and_drop.set_visible(true)
		
	
## Stop the background music when dialogue is started
func on_timeline_started():
	%paperCounter_canvas.hide()
	$background.stop()
	
	
## Play the background music when dialogue is ended
func on_timeline_ended():
	Dialogic.Voice.pause()
	%paperCounter_canvas.show()
	


