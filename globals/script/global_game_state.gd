extends Node

## Check gameplays' state
@export var drag_and_drop = false
@export var lock = false
@export var password = false
@export var password_count = 0
@export var paper_interact = false
@export var click_drag_drop = false
@export var player_position_come_back = false
var first_page = false

## Reset all variables
func reset():
	drag_and_drop = false
	lock = false
	password = false
	password_count = 0
	paper_interact = false
	click_drag_drop = false
	player_position_come_back = false

