extends Node

var parallax_scene:Node2D
var canvas_layer:CanvasLayer
var scene = 0

## Add new node to SceneManager when the faded transition is complete		
## To be able to access the OverlayUI while the gameplay is running
func add_node(path:String):
	await Fade.fade_out().finished
	var child_node = load(path).instantiate()
	add_child(child_node)
	Fade.fade_in()

## Remove node from the SceneManager when it is unused
## This aims for being able to remove the node from the memory.
## To assure that it is safely delete from the node
func remove_node():
	if get_tree().root.has_node("SceneManager/1st_Floor"):
		parallax_scene = get_tree().root.get_node("SceneManager/1st_Floor")
		remove_child(parallax_scene)
		parallax_scene.queue_free()
	elif get_tree().root.has_node("SceneManager/2nd_Floor"):
		parallax_scene = get_tree().root.get_node("SceneManager/2nd_Floor")
		remove_child(parallax_scene)
		parallax_scene.queue_free()
	elif get_tree().root.has_node("SceneManager/PlannerScene"):
		canvas_layer = get_tree().root.get_node("SceneManager/PlannerScene")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/PhonePasscodeScene"):
		canvas_layer = get_tree().root.get_node("SceneManager/PhonePasscodeScene")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/ClickFullPassword"):
		canvas_layer = get_tree().root.get_node("SceneManager/ClickFullPassword")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/Main"):
		canvas_layer = get_tree().root.get_node("SceneManager/Main")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/MainSong#1"):
		canvas_layer = get_tree().root.get_node("SceneManager/MainSong#1")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/Game"):
		canvas_layer = get_tree().root.get_node("SceneManager/Game")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/Main#2"):
		canvas_layer = get_tree().root.get_node("SceneManager/Main#2")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/Game#2"):
		canvas_layer = get_tree().root.get_node("SceneManager/Game#2")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/PhoneScene"):
		canvas_layer = get_tree().root.get_node("SceneManager/PhoneScene")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/PhoneFirstClick"):
		canvas_layer = get_tree().root.get_node("SceneManager/PhoneFirstClick")
		remove_child(canvas_layer)
		canvas_layer.queue_free()
	elif get_tree().root.has_node("SceneManager/PhoneFirstClickMain"):
		canvas_layer = get_tree().root.get_node("SceneManager/PhoneFirstClickMain")
		remove_child(canvas_layer)
		canvas_layer.queue_free() 
	elif get_tree().root.has_node("SceneManager/Dialogue"):
		parallax_scene = get_tree().root.get_node("SceneManager/Dialogue")
		remove_child(parallax_scene)
		parallax_scene.queue_free() 

func check_node():
	if get_tree().root.has_node("SceneManager/1st_Floor"):
		print("have")
	else :
		print("not have")
		
func add_node_no_transition(path:String):		
		var child_node = load(path).instantiate()
		add_child(child_node)


	
