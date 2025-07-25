class_name PlayerController extends CharacterBody2D

@export_category("Debug")
@export var debug: bool = false
@export var illuminated_count : int

@export_category("Stats")
@export var health_component : PlayerHealthComponent
@export var dash_state : DashPlayerState
@export_range(0.0, 100, 0.5) var starting_power : float = 50



var dead : bool = false
var direction: Vector2

func _init() -> void:
	Globals.player = self

func _ready() -> void:
	dash_state.set_current_power(starting_power)

func set_movement_input(input_vector : Vector2) -> void: 
		direction = input_vector
		
func move_player(speed: float, acc: float, dec: float, delta:float) -> void: 
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * speed, acc * delta)
		velocity.y = move_toward(velocity.y, direction.y * speed, acc * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, dec * delta)
		velocity.y = move_toward(velocity.y, 0, dec * delta)
		
	move_and_slide()

func is_illuminated() -> bool: 
	return illuminated_count > 0
