class_name SightComponent extends Node2D

signal on_player_sighted
signal on_player_no_longer_visible

@onready var front: RayCast2D = $Front
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2

var player_sighted: bool = false
var player_was_sighted: bool = false

func _process(_delta: float) -> void:
	player_sighted = front.is_colliding() or ray_cast_2d.is_colliding() or ray_cast_2d_2.is_colliding()
	
	if player_sighted and not player_was_sighted : 
		on_player_sighted.emit()
	
	if not player_sighted and player_was_sighted: 
		on_player_no_longer_visible.emit()

	player_was_sighted = player_sighted
