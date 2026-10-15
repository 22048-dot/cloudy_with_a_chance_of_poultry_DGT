extends Area2D

var speed = 400
@onready var audio_player = $AudioStreamPlayer2D

# Recognises that the item is touched by the player
func _ready():
	body_entered.connect(_on_hit)

# Controls the speed that the item falls and removes egg once it reaches the boundry.
func _process(delta):
	position.y += speed * delta
	if position.y > 1750:
		queue_free()

# If the item has been touched by the player, the player will lose a life
func _on_hit(body):
	print("BOMB HIT")
	if body.name == "Player_node":
		audio_player.play()
		get_parent().lose_life()
		queue_free()
