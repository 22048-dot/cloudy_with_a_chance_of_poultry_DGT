extends Node2D

@onready var egg_scene = preload("res://Scenes/egg.tscn")
@onready var bomb_scene = preload("res://Scenes/bomb.tscn")
@onready var SceneTransitionAnimation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer
@onready var death_ani: AnimationPlayer = $Player_node/AnimationPlayer

var score = 0
var lives = 3

# Updates the score and highscore when the player gains points.
func _ready() -> void:
	SceneTransitionAnimation.play("fade_in")
	$"CanvasLayer/Score_label".text = "Score: " + str(score)
	$"CanvasLayer/Hiscore_label".text = "Highscore: " + str(HisccoreSave.highscore)

# Randomises the position that the items fall at a random position within a range.
func _on_timer_timeout() -> void:
	var item

	# 80% eggs, 20% bombs.
	if randf() < 0.8:
		item = egg_scene.instantiate()
	else:
		item = bomb_scene.instantiate()

	# Random X position.
	item.position = Vector2(
		randf_range(50, 2500),-50)
	add_child(item)

# Adds 1 to the score, and adds to the highscore when nessesary.
func add_score():
	score += 1
	if score > HisccoreSave.highscore:
		HisccoreSave.highscore = score

	$"CanvasLayer/Score_label".text = "Score: " + str(score)
	$"CanvasLayer/Hiscore_label".text = "Highscore: " + str(HisccoreSave.highscore)

# Removes a player's life when they catch a bomb, and ends the game if they lose all lives.
func lose_life():
	lives -= 1
	$"CanvasLayer/Lives label".text = "Lives: " + str(lives)
	if lives <= 0:
		game_over()
# Ends the player's game when all lives are lost, plays a scene transition animation, and changes the scene to the death screen.
func game_over():
	print("GAME OVER")
	death_ani.play("death")
	await get_tree().create_timer(1.5).timeout
	SceneTransitionAnimation.play("fade_out")
	get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
