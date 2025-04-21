extends CharacterBody2D

@export var speed = 265
@export var paper_scene = false

func _ready():
	
	## Set player direction from GlobalDirection when changing to previous scene
	if GlobalDirection.player_direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif GlobalDirection.player_direction == -1:
		$AnimatedSprite2D.flip_h = true
	## Player cannot move until the dialogue is end.
	## @tutorial: https://forum.godotengine.org/t/player-is-able-to-move-while-dialog-is-running/80815/4?fbclid=IwY2xjawIeq2RleHRuA2FlbQIxMAABHWxapb7LmNPThKGUi0aGpv5VAx1klHjEnHtFqgCHiz4ZKjTRuubKV0oZXA_aem_BjXf78ZqB3NMFBRg14sYFA
	Dialogic.timeline_started.connect(set_process.bind(false))
	Dialogic.timeline_started.connect(set_process_input.bind(false))
	Dialogic.timeline_ended.connect(set_process.bind(true))
	Dialogic.timeline_ended.connect(set_process_input.bind(true))

## Set player animation and speed
## If the paper_counter is clicked, the player cannot walk.
func _process(delta):
	paper_scene = GlobalDirection.paper_scene
	current_camera()
	if paper_scene == false: 
		velocity = Vector2.ZERO
		var x_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		## Update player position if GlobalDirection.come_back is true
		if GlobalDirection.come_back == true:
			self.global_position.x = GlobalDirection.player_position_x
			self.global_position.y = GlobalDirection.player_position_y
			GlobalDirection.come_back = false
		move_and_slide()
		if x_input != 0:
			# print("walk")
			if Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_left") or Input.is_action_pressed("move_left") or Input.is_action_just_pressed("move_right"):
				# print("play")
				pass
			else:
				pass
	
			$AnimatedSprite2D.play("walk")
			velocity.x += x_input * speed
			## movement speed per frame
			position += velocity * delta
			## Update direction in GlobalDirection
			if x_input > 0:
				GlobalDirection.player_direction = 1
				$AnimatedSprite2D.flip_h = false
			elif x_input < 0:
				GlobalDirection.player_direction = -1
				$AnimatedSprite2D.flip_h = true
		
		## Player is idle.
		else:
			$AnimatedSprite2D.play("idle")
	
	## During drag and drop the player cannot walk
	elif paper_scene == true  :
		set_process.bind(false)
		set_process_input.bind(false)
		
## Change camera2D based on the current scene
## @tutorial: https://youtu.be/v3v01p26NP0?si=S5mkc9jqiJwklMV7
func current_camera():
	if GlobalDirection.current_scene == "1st_floor":
		$first_camera.enabled = true
		$second_camera.enabled = false
	if GlobalDirection.current_scene == "2nd_floor":
		$first_camera.enabled = false
		$second_camera.enabled = true


	
	
		
