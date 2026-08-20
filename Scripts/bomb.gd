extends Area2D

var speed = 400

func _ready():
	body_entered.connect(_on_hit)

func _process(delta):
	position.y += speed * delta

	if position.y > 1750:
		queue_free()

func _on_hit(body):

	print("BOMB HIT")

	if body.name == "Player_node":
		get_parent().lose_life()
		queue_free()
