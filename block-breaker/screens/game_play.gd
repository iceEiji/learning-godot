extends Node2D

const BlockScene = preload("res://objects/block.tscn")

# グリッド設定
## 横の個数
@export var columns: int = 20
## 縦の個数
@export var rows: int = 9
## 上からのオフセット
@export var margin_top: float = 10.0
## ブロック間の隙間
@export var padding: float = 0.0

func _ready() -> void:
	_spawn_blocks()

func _process(delta: float) -> void:
	pass

## ブロックの生成
func _spawn_blocks() -> void:
	var screen = get_viewport_rect().size
	var columns = GameLayout.MAX_GRID_COLUMNS
	var rows = GameLayout.MAX_GRID_ROWS

	# 幅基準でブロックサイズを計算
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
