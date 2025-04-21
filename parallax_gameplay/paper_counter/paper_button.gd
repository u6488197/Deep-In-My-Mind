extends CanvasLayer

func _ready():
	Dialogic.timeline_started.connect(on_timeline_started)
	Dialogic.timeline_ended.connect(on_timeline_ended)

## Hide when timeline is started
func on_timeline_started():
	self.hide()

## Show when timeline is ended
func on_timeline_ended():
	self.show()

