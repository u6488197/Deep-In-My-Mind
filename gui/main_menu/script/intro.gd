extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("animation")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(6).timeout
	get_tree().change_scene_to_file("res://gui/main_menu/scene/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
