extends DialogicBackground

@onready var time_text = $VBoxContainer/Time
@onready var date_text = $VBoxContainer/Date


var month_name = {
	1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August",
	9: "September", 10: "October", 11: "November", 12: "December"
}

var weekday = {1:"Monday", 2:"Tuesday", 3:"Wednesday", 4:"Thursday", 5:"Friday", 6:"Saturday", 0:"Sunday"}

func _process(_delta):
	## Set time format: 19:00 (example format)
	var time = Time.get_time_string_from_system()
	time = time.substr(0, time.rfind(":")) 
	time_text.text = "[center]"+ str(time)
	
	var date = Time.get_date_dict_from_system(false)
	date_format(date["weekday"], date["month"], date["day"])

	## If the player successfully unlocks the phone, start the dialogue.
	if GlobalGameState.password == true :
		SceneManager.remove_node()
		self.queue_free()
		SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/phone_scene.tscn")

## Set date format: Monday, 22 February (example format)
func date_format(week_day: int, month: int, date: int):
	var day = weekday[week_day]
	var monthname = month_name[month]
	var format = "[center]" + str(day) +", " + str(date)+ " " + str(monthname)	
	date_text.text = format	
	
func _on_go_back_pressed():
	SceneManager.remove_node()
	SceneManager.add_node_no_transition("res://find_a_password/scene/canvaslayer_scene/main.tscn")
	
func _on_calendar_toggled(toggled_on):
	#print("clicked")
	%planner2.set_visible(true)


func _on_return_pressed():
	%planner2.set_visible(false)

func _on_calendar_pressed():
	print("clicked")
	%planner2.set_visible(true)
