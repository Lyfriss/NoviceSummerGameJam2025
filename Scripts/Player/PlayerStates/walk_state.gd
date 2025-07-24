class_name PlayerWalkstate extends PlayerState

@onready var sprite_2d: Sprite2D = $"../../Visual/Sprite2D"

@export_category("Movement settings")
@export var walk_speed : float = 150
@export var acceleration: float = 450
@export var deceleration: float = 750

func update(_delta: float) -> void: 
	player_controller.set_movement_input(player_input.get_movement_vector_normalized())
	if Globals.player.velocity.x != 0:
		sprite_2d.flip_h = Globals.player.velocity.x < 0.0
	
	
	if player_controller.velocity.is_zero_approx() and player_input.get_movement_vector_normalized() == Vector2.ZERO:
		move_to_state.emit("IdleState")
	if Input.is_action_just_pressed("dash"):
		move_to_state.emit("DashState")

func physics_update(delta: float) -> void:
	player_controller.move_player(walk_speed, acceleration, deceleration, delta)
