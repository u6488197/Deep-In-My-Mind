extends Node2D


func _ready():
	Dialogic.start("ev4-5-2")
	GlobalRhythmGame.reset()
	SceneManager.remove_node()

