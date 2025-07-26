extends Node

var player : PlayerController
var ui: UIManager

@export_category("Levles")
@export var levels : Array[PackedScene]
var current_level : int = 0

func change_level(new_level : int) -> void: 
	get_tree().change_scene_to_packed(levels[new_level])
