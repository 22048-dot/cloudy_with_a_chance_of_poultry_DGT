extends Node2D

# Exits the program
func _on_exit_pressed() -> void:
	get_tree().quit()

# Unpauses the game, removing the pause overlay.
func _on_play_pressed():
	get_tree().paused = false
	hide()

# Opens the main menu, exiting the game
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

# Ensures that the pause menu is not open when the player begins the game.
func _ready():
	hide()

# Opens the pause menu if the user presses the "Pause" feature.
func _input(event):
	if event.is_action_pressed("Pause"):
		toggle_pause()

# Ensures the visibility of the pause menu when it has been toggled.
func toggle_pause():
	visible = !visible
	get_tree().paused = visible
