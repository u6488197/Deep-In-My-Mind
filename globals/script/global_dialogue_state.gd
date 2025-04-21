extends Node

## Check the sequence of the collected paper and whether the player has collected it or not 

## Voice box
@export var i4_p1_dialogue_end = false
@export var i4_p2_dialogue_end = false
@export var i4_p3_dialogue_end = false
@export var i4_p4_dialogue_end = false
@export var i4_p5_dialogue_end = false
@export var i4_paper_sequence = 0
@export var i4_status = false

## Picture frame 
@export var p1_scene3_dialogue_end = false
@export var p2_scene3_dialogue_end = false
@export var p3_scene3_dialogue_end = false
@export var p4_scene3_dialogue_end = false
@export var p5_scene3_dialogue_end = false
@export var paper_1_st_floor_scene3 = 0
@export var paper_scene3 = false

## Dining table
@export var p1_scene4_dialogue_end = false
@export var p2_scene4_dialogue_end = false
@export var p3_scene4_dialogue_end = false
@export var p4_scene4_dialogue_end = false
@export var p5_scene4_dialogue_end = false
@export var paper_1_st_floor_scene4 = 0

## Box
@export var i10_12_p1_dialogue_end = false
@export var i10_12_p2_dialogue_end = false
@export var i10_12_p3_dialogue_end = false
@export var i10_12_p4_dialogue_end = false
@export var i10_12_p5_dialogue_end = false
@export var i10_i12_paper = 0

## Table that has the drawer
@export var table_p1_dialogue_end = false
@export var table_p2_dialogue_end = false
@export var table_p3_dialogue_end = false
@export var table_p4_dialogue_end = false
@export var table_p5_dialogue_end = false
@export var paper_2_nd_floor_scene3 = 0

@export var table_status = false
@export var box_status = false

@export var calendar_dialogue = false
@export var planner = false


func update_calendar(argument):
	if argument == "complete":
		calendar_dialogue = true

## Reset all variables	
func reset_dialogue():
	i4_p1_dialogue_end = false
	i4_p2_dialogue_end = false
	i4_p3_dialogue_end = false
	i4_p4_dialogue_end = false
	i4_p5_dialogue_end = false
	i4_paper_sequence = 0
	i4_status = false

	p1_scene3_dialogue_end = false
	p2_scene3_dialogue_end = false
	p3_scene3_dialogue_end = false
	p4_scene3_dialogue_end = false
	p5_scene3_dialogue_end = false
	paper_1_st_floor_scene3 = 0
	paper_scene3 = false

	p1_scene4_dialogue_end = false
	p2_scene4_dialogue_end = false
	p3_scene4_dialogue_end = false
	p4_scene4_dialogue_end = false
	p5_scene4_dialogue_end = false
	paper_1_st_floor_scene4 = 0

	i10_12_p1_dialogue_end = false
	i10_12_p2_dialogue_end = false
	i10_12_p3_dialogue_end = false
	i10_12_p4_dialogue_end = false
	i10_12_p5_dialogue_end = false
	i10_i12_paper = 0

	table_p1_dialogue_end = false
	table_p2_dialogue_end = false
	table_p3_dialogue_end = false
	table_p4_dialogue_end = false
	table_p5_dialogue_end = false
	paper_2_nd_floor_scene3 = 0

	table_status = false
	box_status = false

	calendar_dialogue = false
	planner = false




