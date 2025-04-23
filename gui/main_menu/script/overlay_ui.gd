extends Control

## Use to check whether the save slot is complete or incomplete
## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
var has_just_saved := false

func _ready() -> void:
	hide()
	
func open() -> void:

	if visible:
		return

	## When it is visible, pause the dialogue.
	get_tree().paused = true

	show()
	## Open the OverUI 
	pivot_offset = size/2
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 0.1).from(Vector2.ONE*0.9).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "modulate", Color.WHITE, 0.1).from(Color.TRANSPARENT)
	
	## When main menu is visible and the dialogue is not running,save tab and history tab are hidden.
	if %MainMenu.visible:
		%SaveGUI.set_visible(false)
		%History.set_visible(false)
		has_just_saved = true
	else:
		%SaveGUI.set_visible(true)
		%History.set_visible(true)
		has_just_saved = false
		enable_all_tabs()
		%Music.stop()
	
	## If the gameplay is running, save tab and load tab will be disable.
	if get_tree().root.has_node("SceneManager/1st_Floor") or get_tree().root.has_node("SceneManager/2nd_Floor") or get_tree().root.has_node("SceneManager/PlannerScene") or get_tree().root.has_node("SceneManager/PhonePasscodeScene") or get_tree().root.has_node("SceneManager/ClickFullPassword") or get_tree().root.has_node("SceneManager/Main") or get_tree().root.has_node("SceneManager/DrawerScene")  or get_tree().root.has_node("SceneManager/1st_Floor/DragandDropMain")  or get_tree().root.has_node("SceneManager/2nd_Floor/DragandDropMain") or get_tree().root.has_node("SceneManager/PhoneScene"):
		print("have")
		%SaveGUI.hide()
		%LoadGUI.hide()
		%SaveTab.disable()
		%LoadTab.disable()
	else :
		%SaveGUI.show()
		%LoadGUI.show()
		enable_all_tabs()

## Close the OverlayUI using animation	
func close() -> void:
	pivot_offset = size/2
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "modulate", Color.TRANSPARENT, 0.1)
	tween.tween_callback(hide)
	## After close the tab, unpause the scene
	tween.tween_callback(get_tree().set.bind("paused", false))

	## Open the main menu
	if %MainMenu.visible:
		%MainMenu.open()


func _on_close_button_pressed() -> void:
	close()
	
## Enables all the tabs buttons
func enable_all_tabs() -> void:
	for tab in %Tabs.get_children():
		tab.enable()

## Hides all the tabs
func close_all_tabs() -> void:
	for tab in %Tabs.get_children():
		tab.close()

## Hides all the tabs and opens the given one
func open_tab(tab:Control) -> void:
	close_all_tabs()
	tab.open()
	open()

func open_save_menu() -> void:
	open_tab(%SaveTab)

func open_load_menu() -> void:
	open_tab(%LoadTab)

func open_options_menu() -> void:
	open_tab(%OptionsTab)

func open_history_menu() -> void:
	open_tab(%HistoryTab)

func open_about_menu() -> void:
	open_tab(%AboutTab)

func open_help_menu() -> void:
	open_tab(%HelpTab)

func _on_help_pressed():
	open_tab(%HelpTab)


