extends DialogicBackground

@onready var time_text = $HBoxContainer/time
@onready var date_text = $HBoxContainer/date

var month_name = {
	1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "June", 7: "July", 8: "Aug",
	9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"
}

var weekday = {1:"Mon", 2:"Tues", 3:"Wed", 4:"Thu", 5:"Fri", 6:"Sat", 0:"Sun"}

func _ready() :
	$TextureRect.show()
	$HBoxContainer.show()
	
	
func _process(_delta):
	## Set time format to be 19:00 (example format)
	var time = Time.get_time_string_from_system()
	time = time.substr(0, time.rfind(":")) 
	time_text.text = "[center]"+ str(time)
	
	var date = Time.get_date_dict_from_system(false)
	# print(date)
	date_format(date["weekday"], date["month"], date["day"])
	
## Set date format to be Mon, 22 Feb (example format)
func date_format(week_day: int, month: int, date: int):
	var day = weekday[week_day]
	var monthname = month_name[month]
	var format = "[center]" + str(day) +", " + str(date)+ " " + str(monthname)	
	date_text.text = format	
