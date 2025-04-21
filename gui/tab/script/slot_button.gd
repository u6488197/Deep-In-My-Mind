extends TextureButton

## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
## Emitted when clicked
signal selected
## Emitted when the Delete button is clicked
signal delete_request

## This should be set on the save_load_interface, for all slots.
var time_string := ""

func _ready() -> void:
	_on_mouse_exited()

func _on_pressed() -> void:
	if not $DeleteButton.button_pressed:
		selected.emit()
		
func _on_delete_button_pressed() -> void:
	delete_request.emit()

func clear() -> void:
	%SlotName.text = "Empty Slot"
	%SlotTime.text = ""
	$SlotImage.texture = null

## Loads the info, expecting a "name" and a "date" entry.
func load_info(slot_name: String) -> void:
	if slot_name == "quick_save":
		return
		
	var info := Dialogic.Save.get_slot_info(slot_name)
	if info:
		%SlotName.text = info.name
		%SlotTime.text = time_string.format(info.date)
		$SlotImage.texture = Dialogic.Save.get_slot_thumbnail(slot_name)


func _on_mouse_entered() -> void:
	## If this slot isn't empty, show the delete button
	if $SlotImage.texture != null:
		$DeleteButton.show()


func _on_mouse_exited() -> void:
	## Hide the delete button
	$DeleteButton.hide()
