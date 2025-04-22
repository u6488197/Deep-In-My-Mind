extends Node2D

## @template : https://github.com/LegionGames/Conductor-Example/

var score = 0
var combo = 0

var max_combo = 0


var bpm = 120


var song_position = 0.0
var song_position_in_beats = 2
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

## To track a number of arrows that will spawn on every measure
var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://rhythm_game/scene/note.tscn")
var instance


func _ready():
	randomize()
	## Spawn 4 beats before the song starts
	$Conductor.play_with_beat_offset(4)
	GlobalRhythmGame.beat.connect(_on_Conductor_beat)
	GlobalRhythmGame.measure.connect(_on_Conductor_measure)


func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

## If the game ends, show the score and the label, and then start the dialogue.
func _on_Conductor_beat(position):
	song_position_in_beats = position
	#print(position)
	
	## To track a number of arrows that will spawn on every measure
	## E.g. 16 - 40 
	## 2 notes will spawn on fitst measure
	## 1 note on second measure
	## 1 note on third measure
	## 0 note on fourth measure
	if song_position_in_beats > 15:
		spawn_1_beat = 2
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0
	elif song_position_in_beats > 40:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	elif song_position_in_beats > 60:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 0
	elif song_position_in_beats > 90:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	elif song_position_in_beats > 110:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	elif song_position_in_beats > 130:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	elif song_position_in_beats > 145:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats >= 153:
		GlobalRhythmGame.combo = max_combo
		await get_tree().create_timer(4).timeout
		GlobalRhythmGame.set_score(score)
		%Score.text = str(score)
		%Grade.text = GlobalRhythmGame.grade
		%Panel.show()
		await get_tree().create_timer(3).timeout
		%Panel.hide()
		SceneManager.remove_node()
		SceneManager.add_node("res://rhythm_game/scene/dialogue.tscn")
		
		
## Random the position of the spawn	
func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 4
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 4
		lane = rand
		instance = note.instantiate()
		instance.initialize(lane)
		add_child(instance)
		

## Calculate the score
func increment_score(by):
	if by > 0:
		combo += 1
	else:
		combo = 0

	#print(score)
	score += by * combo
	# $Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""


func reset_combo():
	combo = 0
	$Combo.text = ""
