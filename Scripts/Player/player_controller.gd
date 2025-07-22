class_name PlayerController extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@export_category("Debug")
@export var debug: bool = false
@export var illuminated_count : int

var direction: Vector2

func _init() -> void:
	Globals.player = self

func  _process(_delta: float) -> void:
	print(illuminated_count)
	if illuminated_count > 0: 

		sprite_2d.self_modulate = Color.RED
	if illuminated_count == 0: 
		sprite_2d.self_modulate = Color.WHITE
	
	print(illuminated_count)
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

func set_illumination_amount(amount: int) -> void:
	illuminated_count = max(0, illuminated_count)
