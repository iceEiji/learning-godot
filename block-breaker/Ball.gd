extends RigidBody2D

@export var speed: float = 600.0
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y - 150)

	var angle = randf_range(-PI / 4, PI / 4)
	linear_velocity = Vector2(sin(angle), -1).normalized() * speed

func _process(delta: float) -> void:
	pass
