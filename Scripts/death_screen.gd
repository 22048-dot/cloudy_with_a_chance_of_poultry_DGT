extends Node2D

@onready var death_ani = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	death_ani.play("sad chicken")


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
