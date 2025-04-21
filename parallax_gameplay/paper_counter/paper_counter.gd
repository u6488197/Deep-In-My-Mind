extends CanvasLayer

@export var counter = 0

var dialogue_end = false
var first_enter = false

## Hide all elements
func _ready():
	$paperCount.text = str(GlobalPaperCounter.counter) + "/5"
	Dialogic.timeline_ended.connect(_on_timeline_scene_ended)
	Dialogic.signal_event.connect(DialogicSignal)
	dialogue_end = false
	
	
## If paper_counter is less than 4, hide the click button.
## If paper_counter is equal to 5, paper#1,#2,#3,#4,#5 have not dropped, and paper_interact is true, hide the click button.
## And if paper_interact is false, show the click button.
## If paper_counter is equal to 4 and drag and drop is complete, hide the click button.
func _process(_delta):
	if GlobalPaperCounter.counter <5 :
		$Click.hide()
		
	if GlobalPaperCounter.counter == 5 and GlobalDragAndDrop.Paper1 == false and GlobalDragAndDrop.Paper2 == false and GlobalDragAndDrop.Paper3 == false and GlobalDragAndDrop.Paper4 == false and GlobalDragAndDrop.Paper5 == false:
		if GlobalGameState.paper_interact == true:
			$Click.hide()
		else :
			$Click.show()
			
	elif GlobalPaperCounter.counter == 5 and GlobalGameState.drag_and_drop == true:
		$Click.hide()
	
	if first_enter == true :
		$Click2.hide()
		$Tutorial.set_visible(false)
		

## When dialogue is ended, paper counter is shown.
func _on_timeline_scene_ended():
	self.show()
	Dialogic.timeline_ended.disconnect(_on_timeline_scene_ended)


func DialogicSignal(argument: String):
	if argument == "i4_p1_end" or argument == "i4_p2_end" or argument == "i4_p3_end" or argument == "i4_p4_end" or argument == "i4_p5_end":
		#print("signal received")
		dialogue_end = true
		GlobalPaperCounter.update_counter()
		update_paper_counter()
		
	elif argument == "p1_scene3_end" or argument == "p2_scene3_end" or argument == "p3_scene3_end" or argument == "p4_scene3_end" or argument == "p5_scene3_end":
		#print("signal received")
		dialogue_end = true
		GlobalPaperCounter.update_counter()
		update_paper_counter()
		
	elif argument == "p1_scene4_end" or argument == "p2_scene4_end" or argument == "p3_scene4_end" or argument == "p4_scene4_end" or argument == "p5_scene4_end":
		#print("signal received")
		dialogue_end = true
		GlobalPaperCounter.update_counter()
		update_paper_counter()
		
	elif argument == "i10_12_p1_end" or argument == "i10_12_p2_end" or argument == "i10_12_p3_end" or argument == "i10_12_p4_end" or argument == "i10_12_p5_end":
		#print("box signal received")
		dialogue_end = true
		GlobalPaperCounter.update_counter()
		update_paper_counter()
		
	
	elif argument == "table_p1_end" or argument == "table_p2_end" or argument == "table_p3_end" or argument == "table_p4_end" or argument == "table_p5_end":
		#print("table signal received")
		print(GlobalPaperCounter.counter)
		dialogue_end = true
		GlobalPaperCounter.update_counter()
		update_paper_counter()
		
		
func update_paper_counter():
	if $paperCount:
		$paperCount.text = str(GlobalPaperCounter.counter) + "/5"



