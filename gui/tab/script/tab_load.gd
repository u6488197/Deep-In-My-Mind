extends OverlayUI_Tab

##https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
func _ready() -> void:
	super()


func _open() -> void:
	## Reload the LoadMenu at the same page
	$LoadMenu.load_page()


## When a slot is loaded, hide the menus.
func _on_load_menu_loaded() -> void:
	GlobalGameState.first_page = true
	%OverlayUI.close()
	%MainMenu.hide()
