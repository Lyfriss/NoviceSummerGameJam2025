class_name PlayerStaateMachine extends Node

@export_category("References")
@export var player_controller : PlayerController
@export var player_input : PlayerInputComponent

@export_category("States")
@export var default_state : PlayerState
@export var states : Dictionary = {}
var current_state : PlayerState

func _ready() -> void:
	for child in get_children(): 
		if child is PlayerState: 
			states[child.name] = child
			setup_state(child)
	current_state = default_state
			
func move_to_state(new_state_name: String) -> void: 
	if not states.has(new_state_name):
		return
	var new_state : PlayerState = states[new_state_name]
	var lastState : String = current_state.name
	current_state.exit()
	current_state = new_state
	current_state.enter_state(lastState)

func setup_state(state : PlayerState) -> void:
	state.player_controller = player_controller
	state.player_input = player_input
	state.move_to_state.connect(move_to_state)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _process(delta: float) -> void:
	current_state.update(delta)
