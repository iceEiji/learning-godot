extends Node


func _ready() -> void:
	_go_to_start()

func _go_to_start() -> void:
	get_tree().change_scene_to_file("res://screens/game_start.tscn")

func _go_to_play() -> void:
	get_tree().change_scene_to_file("res://screens/game_play.tscn")
