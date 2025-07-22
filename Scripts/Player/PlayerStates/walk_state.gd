class_name PlayerWalkstate extends PlayerState

@export_category("Movement settings")
@export var walk_speed : float = 150
@export var acceleration: float = 450
@export var deceleration: float = 750

func enter_state(_last_state: String) -> void: 
	#print("Transitioned from " + last_state+" to " + self.name)
	pass
func update(_delta: float) -> void: 
	player_controller.set_movement_input(player_input.get_movement_vector_normalized())
	
	if player_controller.velocity.is_zero_approx() and player_input.get_movement_vector_normalized() == Vector2.ZERO:
		move_to_state.emit("IdleState")

func physics_update(delta: float) -> void:
	player_controller.move_player(walk_speed, acceleration, deceleration, delta)
