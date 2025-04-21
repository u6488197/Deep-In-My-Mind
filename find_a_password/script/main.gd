extends Control

const PASSWORD = "1407"
var text
@onready var count_attempt = $HBoxContainer/Label2
@onready var label1 = $VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label1
@onready var label2 = $VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/Label2
@onready var label3 = $VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer3/Label3
@onready var label4 = $VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer4/Label4
@onready var hint = $VBoxContainer/MarginContainer/VBoxContainer/Indication/Label
@onready var typing = $AudioStreamPlayer
@onready var wrong_passcode = $wrong_passcode

## Phone keypad
## @tutorial: https://www.youtube.com/watch?v=hhu6n6Bkd7w
func _ready():
	$music.play()
	typing.stop()
	wrong_passcode.stop()
	label1.text = ""
	label2.text = ""
	label3.text = ""
	label4.text = ""	
	text = ""
	if GlobalGameState.password_count >= 5:
		hint.text = "Hint:The DD/MM"

## Wait 
## @tutorial: https://gdscript.com/solutions/coroutines-and-yield/
func try_await():
	await get_tree().create_timer(1).timeout


## Concatenate digit 1, 2, 3, and 4
func key_press(digit):
	typing.play()
	if label1.text == "":
		label1.text = str(digit)
	elif label2.text == "":
		label2.text = str(digit)
	elif label3.text == "":
		label3.text = str(digit)
	elif label4.text == "":
		label4.text = str(digit)
	await try_await() 
	# print("Done")
	_check_digit()
	

## Check password 
## if correct change to next scene
## No, remove all number
func _check_digit()-> void:
	text = label1.text +  label2.text +  label3.text + label4.text
	if len(text) == 4:
		GlobalGameState.password_count+= 1 
		#print(text)
		if text == PASSWORD:
			print("CORRECT PASSWORD")
			GlobalGameState.password = true
			$music.stop()
			self.queue_free()
		else:
			wrong_passcode.play()
			print("WRONG PASSWORD")
			label1.text = ""
			label2.text = ""
			label3.text = ""
			label4.text = ""
			
		## Count # of attempts if attempts exceed 5, show hint
		if GlobalGameState.password_count >= 5 and text != PASSWORD:
			hint.text = "Hint:May be the special day? DD/MM"
		

func _on_button_pressed():
	key_press(1)


func _on_button_2_pressed():
	key_press(2)


func _on_button_3_pressed():
	key_press(3)


func _on_button_4_pressed():
	key_press(4)


func _on_button_5_pressed():
	key_press(5)


func _on_button_6_pressed():
	key_press(6)

func _on_button_7_pressed():
	key_press(7)


func _on_button_8_pressed():
	key_press(8)


func _on_button_9_pressed():
	key_press(9)

	
func _on_button_11_pressed():
	key_press(0)


## Remove each digit individually
func _on_button_12_pressed():
	if label4.text != "":
		label4.text = ""
	elif label3.text != "":
		label3.text = ""
	elif label2.text != "":
		label2.text = ""
	elif label1.text != "":
		label1.text = ""
