extends StaticBody2D


func _ready() -> void:
	add_to_group("blocks")
	_sync_collision_to_sprite()

func _physics_process(delta: float) -> void:
	pass

## Sprite2D のテクスチャサイズに合わせて CollisionShape2D を設定する。
func _sync_collision_to_sprite() -> void:
	var texture = $Sprite2D.texture
	if texture == null:
		return
	var size = texture.get_size()
	var shape = RectangleShape2D.new()
	shape.size = size
	$CollisionShape2D.shape = shape

## テクスチャサイズを返す。Main.gd でのグリッド配置計算に使う。
func get_size() -> Vector2:
	if $Sprite2D.texture == null:
		return Vector2.ZERO
	return $Sprite2D.texture.get_size()
