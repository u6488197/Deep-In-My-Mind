extends Control

## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git
var options_game

func _ready() -> void:
	hide()

## Displays a warning/option popup with the given question/text.
## A cancel button is always present, unless [has_cancel] is false.
## For each dictionary in [options] (which can have "text":String and "action":Callable entries),
##  a button will be added.
func warn(text:String, options:Array, has_cancel := true) -> void:
	%Message.text = text
	options_game = options
	for child in %WarningOptions.get_children():
		child.queue_free()

	if has_cancel:
		options.append({'text':'Cancel'})

	for option in options:
		var button := Button.new()
		button.text = option.text
		if option.has("action"):
			button.pressed.connect(option.action)
		button.pressed.connect(close)
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		%WarningOptions.add_child(button)

	open()


func open() -> void:
	if visible:
		return

	## Opening Animation
	show()
	pivot_offset = size/2
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 0.1).from(Vector2.ONE*0.9).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "modulate", Color.WHITE, 0.1).from(Color.TRANSPARENT)



func close() -> void:
	## If there is "No" button and OverlayUI is visible, when click on no, unpause the game.
	for option in options_game:
		var button := Button.new()
		button.text = option.text
		if button.text == "No":
			if %OverlayUI.visible:
				get_tree().paused = true
			else :
				get_tree().paused = false
	
				
	## Closing Animation
	pivot_offset = size/2
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2.ONE*0.9, 0.1).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
	tween.parallel().tween_property(self, "modulate", Color.TRANSPARENT, 0.1)
	tween.tween_callback(hide)


