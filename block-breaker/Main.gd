extends Node2D

const BlockScene = preload("res://block.tscn")

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
	var temp = BlockScene.instantiate()
	add_child(temp)
	var block_size = temp.get_size()
	temp.queue_free()

	var screen_width = get_viewport_rect().size.x
	var total_width = columns * block_size.x + (columns - 1) * padding
	var start_x = (screen_width - total_width) / 2.0 + block_size.x / 2.0

	# 上端ぴったりに合わせる
	var start_y = block_size.y / 2.0

	for row in range(rows):
		for col in range(columns):
			var block = BlockScene.instantiate()
			add_child(block)
			block.position = Vector2(
				start_x + col * (block_size.x + padding),
				start_y + row * (block_size.y + padding)
			)
