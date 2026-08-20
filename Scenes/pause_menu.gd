extends Node2D

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed():
	get_tree().paused = false
	hide()

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("Pause"):
		toggle_pause()


func toggle_pause():
	visible = !visible
	get_tree().paused = visible
