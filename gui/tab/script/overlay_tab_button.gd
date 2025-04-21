extends TextureButton


func _ready() -> void:
	toggled.connect(on_toggled)

## When the mouse is pressed, disable button.
func on_toggled(toggled_on):
	if toggled_on:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	else:
		mouse_filter = Control.MOUSE_FILTER_STOP
