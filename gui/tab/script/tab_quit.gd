extends OverlayUI_Tab

## Tab that contains navigational buttons.
## Only accessible while a game is running.


func _ready() -> void:
	super()


## Calls [method go_to_main_menu] or presents a warning, if there is unsaved progress.
func _on_main_menu_pressed() -> void:
	if not %OverlayUI.has_just_saved:
		
		%WarningDialog.warn("Unsaved slot will be lost",
			[
				{"text":"Main Menu", "action":go_to_main_menu}
			])
	else:
		
		go_to_main_menu()


## Allows to quit, but asks the player if they are sure.
func _on_quit_pressed() -> void:
	
	%WarningDialog.warn("Are you sure you want to quit?",
		[
			{"text":"Yes", "action":get_tree().quit},
			{"text": "No"}
		])


## Stops dialogic, closes the overlay UI and opens the main menu
func go_to_main_menu() -> void:
	
	Dialogic.end_timeline()
	Dialogic.clear()
	%MainMenu.open()
	%OverlayUI.close()
