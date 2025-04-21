extends TextureRect

@export_enum("Paper1","Paper2", "Paper3", "Paper4", "Paper5") var type = 0
@onready var drop = %drop

## If yes, the type of drop zone and paper are matched, allowing the placement of the paper.
## If no, prohibit the drop_zone action
## @tutorial: https://www.youtube.com/watch?v=KA_SomgewJA
func _can_drop_data(_at_position, data):
	if data[1] == type:
		return true
	return false
	
## Drop the paper into the selected drop zone.
func _drop_data(at_position, data):
	%drop.play()
	data[0].get_parent().remove_child(data[0])
	add_child(data[0])
	data[0].position = at_position
	if  type == 0 :
		GlobalDragAndDrop.Paper1 = true
	elif type == 1 :
		GlobalDragAndDrop.Paper2 = true
	elif type == 2 :
		GlobalDragAndDrop.Paper3 = true
	elif type == 3 :
		GlobalDragAndDrop.Paper4 = true
	elif type == 4 :
		GlobalDragAndDrop.Paper5 = true
	data[0].set_process_input(false)
	data[0].set_process(false)

	#print("Paper1: " + str(GlobalDragAndDrop.Paper1))
	#print("Paper2: " + str(GlobalDragAndDrop.Paper2))
	#print("Paper3: " + str(GlobalDragAndDrop.Paper3))
	#print("Paper4: " + str(GlobalDragAndDrop.Paper4))
	#print("Paper5: " + str(GlobalDragAndDrop.Paper5))
	
