extends CharacterBody2D

@export_category("Debug")
@export var debug: bool = false

@export_category("Movement parameters")
@export var speed : float = 100
@export var acc: float = 100
@export var dec: float = 450

func _physics_process(delta: float) -> void:
	
	if debug:
		print(velocity)

	var direction := Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	
	if direction:
		velocity.x =  clamp(velocity.x, lerp(velocity.x, direction.x * speed, acc * delta), direction.x * speed)
		velocity.y = clamp(velocity.y, lerp(velocity.y, direction.y * speed, acc * delta), direction.y * speed)
	else:
		velocity.x = move_toward(velocity.x, 0, dec * delta)
		velocity.y = move_toward(velocity.y, 0, dec * delta)

	move_and_slide()
