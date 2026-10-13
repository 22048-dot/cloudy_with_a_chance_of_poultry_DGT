extends Node2D

@onready var SceneTransitionAnimation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer

# Plays fade in animation
func _ready() -> void:
	SceneTransitionAnimation.play("fade_in")

# Changes scene to the main menu
func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

# Adjusts the volume based on the slider the player can move
func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)

# Adjusts the brightness based on the slider the player can move
func _on_brightness_value_changed(value: float) -> void:
	Brightness.color = Color(value, value, value)

# Changes the scene to controls screen
func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls_screen.tscn")
