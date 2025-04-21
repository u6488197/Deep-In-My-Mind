extends Node

## Drag and drop's papers

## Use to check if it is already dropped in the drop zone or not
@export var Paper1 = false
@export var Paper2 = false
@export var Paper3 = false
@export var Paper4 = false
@export var Paper5 = false
@export var count = 0
@export var click = false
var dialogue_end = false

## Reset variables
func reset():
	Paper1 = false
	Paper2 = false
	Paper3 = false
	Paper4 = false
	Paper5 = false
	count = 0
	click = false
	dialogue_end = false
