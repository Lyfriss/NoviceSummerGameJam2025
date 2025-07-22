class_name PlayerState extends Node

signal move_to_state(next_state :String)

var player_controller : PlayerController
var player_input : PlayerInputComponent

func enter_state(_last_state: String) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
