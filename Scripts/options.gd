extends Node2D

@onready var SceneTransitionAnimation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer


func _ready() -> void:
	SceneTransitionAnimation.play("fade_in")

func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)

func _on_brightness_value_changed(value: float) -> void:
	Brightness.color = Color(value, value, value)

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls_screen.tscn")
