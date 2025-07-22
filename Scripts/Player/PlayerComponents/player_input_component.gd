class_name PlayerInputComponent extends Node

var movement_input : Vector2

func get_movement_vector_normalized() -> Vector2:
	return Input.get_vector("move_left","move_right", "move_up", "move_down").normalized()
