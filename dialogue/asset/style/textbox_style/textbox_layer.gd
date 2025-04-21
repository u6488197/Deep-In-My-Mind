@tool
extends DialogicLayoutLayer

## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
var overlay_ui: Control = null
var quick_save = "quick_save"


func _ready() -> void:
	
	Dialogic.Inputs.auto_advance.toggled.connect(_on_auto_advance_toggled)
	
	if get_tree().root.has_node("Menus"):
		overlay_ui = get_tree().root.get_node("Menus/GUILayer/OverlayUI")
		
## If the gameplay is running, hide save, qsave, and qload button.
func _process(_delta):
	if get_tree().root.has_node("SceneManager/1st_Floor") or get_tree().root.has_node("SceneManager/2nd_Floor") or get_tree().root.has_node("SceneManager/PlannerScene") or get_tree().root.has_node("SceneManager/PhonePasscodeScene") or get_tree().root.has_node("SceneManager/ClickFullPassword") or get_tree().root.has_node("SceneManager/Main") or get_tree().root.has_node("SceneManager/DrawerScene")  or get_tree().root.has_node("SceneManager/1st_Floor/DragandDropMain")  or get_tree().root.has_node("SceneManager/2nd_Floor/DragandDropMain") or get_tree().root.has_node("SceneManager/PhoneFirstClickMain"):
		%Save.set_visible(false)
		%QSave.set_visible(false)
		%QLoad.set_visible(false)
	else:
		%Save.set_visible(true)
		%QSave.set_visible(true)
		%QLoad.set_visible(true)
	
## Take the thumbnail because it can open the save tab from this tab
func _on_history_pressed() -> void:
	Dialogic.Save.take_thumbnail()
	Dialogic.History.open_history()


func _on_auto_toggled(toggled_on: bool) -> void:
	Dialogic.Inputs.auto_advance.enabled_until_user_input = toggled_on
	Dialogic.Inputs.auto_skip.enabled = false


## Dialogic informs us that the autoadvance state has changed
func _on_auto_advance_toggled(toggled_on: bool) -> void:
	%Auto.set_pressed_no_signal(toggled_on)


func _on_save_pressed() -> void:
	if overlay_ui:
		Dialogic.Save.take_thumbnail()
		overlay_ui.open_save_menu()

## Save to quick_save slot in order to not be duplicate with the slots in the save-load interface
func _on_q_save_pressed() -> void:
	Dialogic.Save.save(quick_save, false, Dialogic.Save.ThumbnailMode.STORE_ONLY)
	Dialogic.Save.set_slot_info(quick_save, {
		"name": "quick Save",
		"date": Time.get_datetime_dict_from_system()
	})
	
	
## Load the quick_save slot	
func _on_q_load_pressed() -> void:
	if Dialogic.Save.has_slot(quick_save):
		Dialogic.Save.load(quick_save)

## Take the thumbnail because it can open the save tab from this tab
func _on_options_pressed() -> void:
	if overlay_ui:
		Dialogic.Save.take_thumbnail()
		overlay_ui.open_options_menu()


	


