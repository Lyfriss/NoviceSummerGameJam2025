class_name Guard extends CharacterBody2D

## REFERENCES: 
@onready var sight_component: SightComponent = %SightComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

enum states {IDLE, PATROL, CHASE}
@export var default_state : states
var current_state : states

@export_category("Idle State Parameters")
@export var guarding_looking_direction : Vector2 = Vector2.DOWN
var inizial_position : Vector2


@export_category("Patrol State Parameters")
@export var patrol_points : Array[Marker2D]
@export var patrol_speed : float = 75
var current_patrol_point : int = 0

@export_category("Chase State Parameters")
@export var chase_speed : float = 100
@export var guard_damege : float = 100


func _ready() -> void:
	current_state = default_state
	inizial_position = global_position
	sight_component.look_at(guarding_looking_direction+ sight_component.global_position)
	print(guarding_looking_direction)

func _physics_process(delta: float) -> void:
	
	match current_state:
		states.IDLE : idle_behavior(delta)
		states.PATROL : patrol_behavior(delta)
		states.CHASE : chase_behavior(delta)

func idle_behavior(_delta: float) -> void:
	if global_position.distance_to(inizial_position) > 1: 
			move_to_target(inizial_position, patrol_speed)
	else:
		sight_component.look_at(guarding_looking_direction+ sight_component.global_position)
		
func patrol_behavior(_delta: float) -> void: 
	if global_position.distance_to(patrol_points[current_patrol_point].global_position) > 1 : 
		move_to_target(patrol_points[current_patrol_point].global_position, patrol_speed)
	else: 
		current_patrol_point = (current_patrol_point + 1) % patrol_points.size()
		velocity = Vector2.ZERO
	
func chase_behavior(delta: float) -> void: 
	if (global_position.distance_to(Globals.player.global_position) > 16): 
		move_to_target(Globals.player.global_position, chase_speed)
	
func move_to_target(target: Vector2 , speed: float) -> void: 
	var direction = (target - global_position).normalized()
	sight_component.look_at(target)
	velocity = direction * speed
	move_and_slide()


func _on_sight_component_on_player_sighted() -> void:
	current_state = states.CHASE
	print("PLAYER SIGHTED")

func _on_sight_component_on_player_no_longer_visible() -> void:
	current_state = default_state
	print("He got away")
