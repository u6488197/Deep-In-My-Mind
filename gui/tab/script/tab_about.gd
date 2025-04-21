extends OverlayUI_Tab

var first_enter = false

## If open the about tab for the first time, show credits.
func _process(_delta):
	if first_enter == false :
		%Attribution.set_visible(false)
	else:
		%Attribution.set_visible(true)
	
## If open credits, hide attribution
func _on_credits_pressed():
	first_enter = false
	%Credits.set_visible(true)
	%Attribution.set_visible(false)

## If open attribution, hide credits
func _on_attribution_pressed():
	first_enter = true
	%Credits.set_visible(false)
	%Attribution.set_visible(true)


	

