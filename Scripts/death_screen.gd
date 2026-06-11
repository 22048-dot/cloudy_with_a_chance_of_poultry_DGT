extends Node2D

@onready var death_ani = $AnimationPlayer
@onready var SceneTransitionAnimation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	death_ani.play("sad chicken")
	SceneTransitionAnimation.play("fade_in")

func _on_back_to_menu_pressed() -> void:
	SceneTransitionAnimation.play("fade_out")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
