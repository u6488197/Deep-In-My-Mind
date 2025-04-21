extends Node2D


func _on_button_pressed():
	SceneManager.remove_node()
	SceneManager.add_node("res://rhythm_game/song#1/scene/game.tscn")
	
