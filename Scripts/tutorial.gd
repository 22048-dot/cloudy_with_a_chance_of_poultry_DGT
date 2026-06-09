extends Node2D

@onready var tut_play = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tut_play.play("show_tut")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")
