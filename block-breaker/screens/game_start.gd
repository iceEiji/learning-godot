extends Control

func _ready() -> void:
	theme = UIManager.theme
	_setup_layout()

func _setup_layout() -> void:
	var screen = get_viewport_rect().size

	var label = $TitleLabel
	label.text = "Block Breaker"
	label.theme_type_variation = "TitleLabel"
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.size.x = screen.x
	label.position = Vector2(0, screen.y * 0.35)

	var button = $StartButton
	button.text = "Start"
	button.theme_type_variation = "PrimaryButton"
	button.position = Vector2((screen.x - button.size.x) / 2.0, screen.y * 0.55)
	button.pressed.connect(_on_start_pressed)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/game_play.tscn")
