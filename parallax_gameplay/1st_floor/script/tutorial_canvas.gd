extends CanvasLayer

func _on_ready():
	if %HBoxContainer3:
		%HBoxContainer3.show()
	
## If the player first clicks on A/D or there is a paper that is already collected, hide all elements.
func _process(_delta):
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		hide_elements()
	if GlobalPaperCounter.counter >= 1 :
		hide_elements()
	
## Hide all tutorial UI elements
func hide_elements():
	if %HBoxContainer3:
		%HBoxContainer3.hide()
	%Label.hide()
	
