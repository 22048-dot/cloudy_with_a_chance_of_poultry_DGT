extends Area2D

var speed = 400

func _ready():
	body_entered.connect(_on_hit)

func _process(delta):
	position.y += speed * delta

func _on_hit(body):

	print("EGG HIT")

	if body.name == "Player_node":
		get_parent().add_score()
		queue_free()
