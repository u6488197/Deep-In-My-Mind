extends  OverlayUI_Tab

## When first enter, hide reporter.
func _ready():
	%Reporter.hide()
	%TextureRect.show()

## When click on report bug, show reporter.
func _on_report_pressed():
	%Report.hide()
	%Reporter.show()

	
	
