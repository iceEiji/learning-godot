extends CharacterBody2D


@export var speed: float = 400.0
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y - 100)

func _physics_process(delta: float) -> void:
	var direction: float = 0.0
	if Input.is_action_pressed("move_left"):
		direction = -1.0
	if Input.is_action_pressed("move_right"):
		direction = 1.0
	
	velocity.x = direction * speed
	move_and_collide(velocity * delta)
	position.x = clamp(position.x, 0, screen_size.x)
