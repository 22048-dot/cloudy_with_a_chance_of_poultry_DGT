extends Node2D

@onready var egg_scene = preload("res://Scenes/egg.tscn")
@onready var bomb_scene = preload("res://Scenes/bomb.tscn")
@onready var SceneTransitionAnimation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer
@onready var death_ani: AnimationPlayer = $Player_node/AnimationPlayer

var score = 0
var lives = 3
var highscore = score

func _ready() -> void:
	SceneTransitionAnimation.play("fade_in")

func _on_timer_timeout() -> void:
	var item

	# 80% eggs, 20% bombs
	if randf() < 0.8:
		item = egg_scene.instantiate()
	else:
		item = bomb_scene.instantiate()

	# Random X position
	item.position = Vector2(
		randf_range(50, 2500),
		-50
	)

	add_child(item)

func add_score():
	score += 1
	if score > highscore:
		highscore = score
		$"CanvasLayer/Score_label".text = "Score: " + str(score)
		$"CanvasLayer/Hiscore_label".text = "Highscore: " + str(highscore)

func lose_life():
	lives -= 1

	$"CanvasLayer/Lives label".text = "Lives: " + str(lives)

	if lives <= 0:
		game_over()

func game_over():
	print("GAME OVER")
	death_ani.play("death")
	await get_tree().create_timer(1.5).timeout
	SceneTransitionAnimation.play("fade_out")
	get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
