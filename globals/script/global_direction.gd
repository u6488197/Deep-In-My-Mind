extends Node

var player_direction = 1
var current_scene = ""
var paper_scene = false
var come_back = false
var player_position_x = 1754 ## Position after coming back from second floor
var player_position_y = 17 ## Position after coming back from second floor
var game_first_login = true
var first_enter = true 

## Update current scene where the player is in
func update_scene(scene:String):
	current_scene = scene
	
func update_paper_scene(check:bool):
	paper_scene = check

func update_player_position(x:int,y:int):
	player_position_x = x
	player_position_y = y

	
## Set player's position after finishing drag & drop
func update_come_back(check:bool):
	come_back = check

## Reset all variables
func reset_direction():
	player_direction = 1
	current_scene = ""
	paper_scene = false
	come_back = false
	game_first_login = true
	first_enter = true
	player_position_x = 1754
	player_position_y = 17


