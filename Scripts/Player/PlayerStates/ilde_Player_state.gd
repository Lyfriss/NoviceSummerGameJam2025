class_name PlayerIdlaState extends PlayerState


func enter_state(_last_state: String) -> void: 
	#print("Transitioned from " + last_state+" to " + self.name)
	pass
func update(_delta: float) -> void:
	if player_input.get_movement_vector_normalized(): 
		move_to_state.emit("WalkState")
