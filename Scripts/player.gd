extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $ChickenSprite
@onready var all_interactions = []
@export var fall_limit: float = 2500

func fall():
	self.global_position = Vector2(391, 1667)

var last_direction = Vector2.ZERO
var score = 0

const SPEED = 1000
const FRICTION = 20000
const JUMP_VELOCITY = -2500
const GRAVITY = 4000

func _ready():
	animation_player.play("idle")
	up_direction = Vector2.UP
	floor_stop_on_slope = true
	floor_max_angle = deg_to_rad(45)
	
func _physics_process(delta):
	if position.y > fall_limit:
		await get_tree().create_timer(0.2).timeout
		fall()
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_pressed("A"):
		animation_player.play("running")
		direction.x -= 1
	
	if Input.is_action_pressed("D"):
		animation_player.play("running")
		direction.x += 1

	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		# Jump input
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			animation_player.play("jump")
			
	# Handle horizontal movement
	if direction.x != 0:
		var input_velocity = Vector2(direction.x * SPEED, 0)

		# Project input onto floor if on floor
		if is_on_floor():
			input_velocity = input_velocity.slide(get_floor_normal())

		velocity.x = input_velocity.x
		sprite.flip_h = direction.x > 0

		
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		

	move_and_slide()
