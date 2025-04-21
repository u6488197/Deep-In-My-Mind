extends TextureRect

@export_enum("Paper1","Paper2", "Paper3", "Paper4", "Paper5") var type = 1

## Allow texture to be dragged
## @tutorial: https://www.youtube.com/watch?v=KA_SomgewJA
func _get_drag_data(_at_position):
	var data = [self,type]
	var prev = TextureRect.new()
	prev.texture = texture
	set_drag_preview(prev)
	return data
