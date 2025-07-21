extends CharacterBody2D

@export var speed : float = 5.0


func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
