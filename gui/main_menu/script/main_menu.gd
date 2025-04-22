extends CanvasLayer


@export var beginning_timeline := "ev1-1"
@export var WarningDialog: Control = null
var first_page


func _ready() -> void:
	first_page = false
	open()
	## Connect to Dialogic Signal
	Dialogic.signal_event.connect(_on_dialogic_signal_event)
	
	
## Allow auto quit when it is on the main menu page
## If the dialogue is running, auto quit will be disabled.			
## If main menu is visible, auto quit is true.	
func _process(_delta):
	if first_page == true:
		get_tree().auto_accept_quit = false
	else :
		get_tree().auto_accept_quit = true
	
	if %MainMenu.visible:
		get_tree().auto_accept_quit = true
	

## Show the main menu page
## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
func open() -> void:
	show()
	Dialogic.Voice.pause()
	## Show the continue button when there is the latest slot
	%Continue.visible = not Dialogic.Save.get_latest_slot().is_empty()
	

## When the game is over, reset global variables and set the latest slot to empty.
## Open this page when the game is over
func _on_dialogic_signal_event(arg: Variant) -> void:
	if arg == "GAME_END":
		$Music.play()
		GlobalGameState.first_page = false	
		Dialogic.clear()
		Dialogic.end_timeline()
		GlobalDialogueState.reset_dialogue()
		GlobalDirection.reset_direction()
		GlobalDragAndDrop.reset()
		GlobalGameState.reset()
		GlobalPaperCounter.reset()
		GlobalRhythmGame.reset()
		Dialogic.Save.set_latest_slot("")
		open()

## Stop the music when the game starts and show the disclaimer
func _on_start_pressed() -> void:
	first_page = true
	$Music.stop()
	%Warning.show()
	hide()


## Load the current slot 
func _on_continue_pressed() -> void:
	$Music.stop()
	first_page = true
	Dialogic.Save.load(Dialogic.Save.get_latest_slot())
	hide()


func _on_load_pressed() -> void:
	$Music.stop()
	first_page = true
	%OverlayUI.open_load_menu()


func _on_options_pressed() -> void:
	$Music.stop()
	first_page = true
	%OverlayUI.open_options_menu()


func _on_about_pressed() -> void:
	$Music.stop()
	first_page = true
	%OverlayUI.open_about_menu()

func _on_help_pressed() -> void:
	$Music.stop()
	first_page = true
	%OverlayUI.open_help_menu()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_warning_pressed():
	%Warning.hide()
	%Music.stop()
	Dialogic.start(beginning_timeline)
	hide()


## If the game starts, it will show the warning and pause the scene.
## If main menu is visible, it will change to auto quit.
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if first_page == true :
			if %MainMenu.visible:
				pass
			else :
				get_tree().paused = true
				show_exit_warning()
		else :
			pass
		
		
## If yes, quit the game.
## If no, continue the game.
func show_exit_warning():
	WarningDialog.warn("Are you sure you want to quit?",
						[
							{"text":"Yes", "action": get_tree().quit},
							{"text":"No"}
						], false
					)
					






