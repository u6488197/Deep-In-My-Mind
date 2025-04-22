extends OverlayUI_Tab

## https://github.com/Jowan-Spooner/Dialogic2FantasyTemplate.git

@export var default_music_volume := 0.5
@export var default_sound_effects_volume := 0.5
@export var default_voice_acting_volume := 1
var display = 0
var text_speed:float = 1

## Set the settings
func _ready() -> void:
	super()
	print(default_music_volume)
	print(default_sound_effects_volume)
	print(default_voice_acting_volume)
	_on_display_setting_toggled(Dialogic.Save.get_global_info("display_mode", display))
	Dialogic.Inputs.auto_advance.delay_modifier = Dialogic.Save.get_global_info("auto_advance_modifier", 1)
	Dialogic.Audio.base_music_player.bus = "Music"
	Dialogic.Audio.base_sound_player.bus = "SFX"
	Dialogic.Voice.set_bus("Voice")
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"),
		linear_to_db(Dialogic.Save.get_global_info("voice_acting_volume", default_voice_acting_volume)))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),
		linear_to_db(Dialogic.Save.get_global_info("music_volume", default_music_volume)))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),
		linear_to_db(Dialogic.Save.get_global_info("sound_effects_volume", default_sound_effects_volume)))

## Loads the settings values into the settings controls
func _open() -> void:
	print(default_music_volume)
	print(default_sound_effects_volume)
	print(default_voice_acting_volume)
	## Display Setting
	if get_viewport().get_window().mode == Window.MODE_FULLSCREEN:
		_on_display_setting_toggled(true)
		display = 1


	%Setting_TextSpeed.value = sqrt(Dialogic.Settings.get_setting("text_speed", text_speed))
	%Setting_AutoSpeed.value = Dialogic.Save.get_global_info("auto_advance_modifier", 1)
	%Setting_MusicVolume.value = Dialogic.Save.get_global_info("music_volume", default_music_volume)
	%Setting_SoundsVolume.value = Dialogic.Save.get_global_info("sound_effects_volume", default_sound_effects_volume)
	%Setting_VoiceActing.value = Dialogic.Save.get_global_info("voice_acting_volume", default_voice_acting_volume)
	
	
## Text Speed Setting
func _on_setting_text_speed_value_changed(value: float) -> void:
	## The reason to be exponential is to avoid the huge different text speed gap between the lowest and highest value. 
	Dialogic.Settings.text_speed = value * value
	text_speed = float(value*value)
	Dialogic.Save.get_global_info("text_speed", text_speed)
	
	
## Auto Advance Speed Setting
func _on_setting_auto_speed_value_changed(value: float) -> void:
	Dialogic.Inputs.auto_advance.delay_modifier = value
	Dialogic.Save.set_global_info("auto_advance_modifier", value)
	


## Music
func _on_setting_music_volume_value_changed(value: float) -> void:
	Dialogic.Save.set_global_info("music_volume", value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

## Sound Effects
func _on_setting_sounds_volume_value_changed(value: float) -> void:
	Dialogic.Save.set_global_info("sound_effects_volume", value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))

	
## Display Setting
func _on_display_setting_toggled(toggled_on):
	match toggled_on:
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			display = 1
			
		false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			display = 0
	
	Dialogic.Save.set_global_info("display_mode", display)
	
	
## Voice Acting
func _on_setting_voice_acting_value_changed(value:float):
	Dialogic.Save.set_global_info("voice_acting_volume", value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"), linear_to_db(value))
