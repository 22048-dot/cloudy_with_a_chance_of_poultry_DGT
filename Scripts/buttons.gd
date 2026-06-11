extends Node2D

@onready var music_player = $"../AudioStreamPlayer2D"
@onready var SceneTransitionAnimation: AnimationPlayer = $"../SceneTransitionAnimation/AnimationPlayer"

func _ready() -> void:
	SceneTransitionAnimation.play("fade_in")
	music_player.play()

func _on_play_pressed() -> void:
	SceneTransitionAnimation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")

func _on_exit_pressed() -> void:
	SceneTransitionAnimation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
