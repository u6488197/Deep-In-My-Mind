extends Control

@export var WarningDialog: Control = null

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		show_exit_warning()

func show_exit_warning():
	WarningDialog.warn(
		"Are you sure you want to exit the game?",
		[
			{
				"text": "Yes,
				Quit", "No": 
				func(): get_tree().quit()
			}
			
		]
	)

