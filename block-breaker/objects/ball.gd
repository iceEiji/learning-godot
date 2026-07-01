extends RigidBody2D

@export var speed: float = 600.0

var screen_size: Vector2
var _is_launched: bool = false

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 4
	body_entered.connect(_on_body_entered)
	screen_size = get_viewport_rect().size
	reset()

## 初期位置に戻して待機状態にする
func reset() -> void:
	_is_launched = false
	freeze = true
	position = Vector2(screen_size.x / 2, screen_size.y - 100)

## ボールを発射する
func launch() -> void:
	if _is_launched:
		return
	_is_launched = true
	freeze = false
	var angle = randf_range(-PI / 4, PI / 4)
	linear_velocity = Vector2(sin(angle), -1).normalized() * speed

func _physics_process(_delta: float) -> void:
	if not _is_launched:
		return
	if position.y > screen_size.y:
		get_parent().on_ball_lost()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		launch()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("blocks"):
		body.call_deferred("queue_free")
