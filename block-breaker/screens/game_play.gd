extends Node2D

const BlockScene = preload("res://objects/block.tscn")

## ブロック間の隙間
@export var padding: float = 0.0

## 残機
var lives: int = GameLayout.DEFAULT_LIVES

func _ready() -> void:
	_spawn_blocks()
	_update_lives_display()

## ブロックの生成
func _spawn_blocks() -> void:
	var screen = get_viewport_rect().size
	var columns = GameLayout.MAX_GRID_COLUMNS
	var rows = GameLayout.MAX_GRID_ROWS

	var block_w = screen.x / columns
	var texture = BlockScene.instantiate().get_node("Sprite2D").texture
	var aspect = texture.get_height() / float(texture.get_width())
	var block_h = block_w * aspect

	for row in range(rows):
		for col in range(columns):
			var block = BlockScene.instantiate()
			add_child(block)
			block.get_node("Sprite2D").scale = Vector2(
				block_w / texture.get_width(),
				block_h / texture.get_height()
			)
			var shape = RectangleShape2D.new()
			shape.size = Vector2(block_w - padding, block_h - padding)
			block.get_node("CollisionShape2D").shape = shape
			block.position = Vector2(
				block_w / 2.0 + col * block_w,
				block_h / 2.0 + row * block_h
			)

## 残機を1減らす。0になったらゲームオーバー画面へ。
func on_ball_lost() -> void:
	if lives <= 0:
		return
	lives -= 1
	_update_lives_display()
	if lives <= 0:
		# TODO: ゲームオーバー
		pass
	else:
		$Ball.reset()

## 残機表示を更新する
func _update_lives_display() -> void:
	var container = $HUD/LivesContainer
	for child in container.get_children():
		child.queue_free()
	for i in range(lives):
		var icon = TextureRect.new()
		icon.texture = preload("res://assets/sprites/life.png")
		container.add_child(icon)
