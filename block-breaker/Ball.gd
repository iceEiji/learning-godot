extends RigidBody2D

@export var speed: float = 600.0
var screen_size: Vector2

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 4
	body_entered.connect(_on_body_entered)

	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y - 100)

	var angle = randf_range(-PI / 4, PI / 4)
	linear_velocity = Vector2(sin(angle), -1).normalized() * speed

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	print("hit: ", body.name, " groups: ", body.get_groups())
	if body.is_in_group("blocks"):
		body.call_deferred("queue_free")
