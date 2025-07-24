class_name DashPlayerState extends PlayerState

@export_category("References")
@export var dash_particles : GPUParticles2D

@export_category("Dash settings")
@export_range(0.0, 100, 10.0) var max_power : float = 100
@export_range(0.0, 25, 5.0) var power_cost : float = 20.0
@onready var current_power : float = max_power : set = set_current_power

@export_category("Movement settings")
@export var dash_speed : float = 250
@export var acceleration : float = 1000
@export var deceleration : float = 450

@onready var timer: Timer = $Timer


func enter_state(_last_state: String) -> void:
	if current_power == 0: 
		move_to_state.emit("WalkState")
		return
	dash_particles.emitting = true
	timer.start()
	
func physics_update(delta: float) -> void:
	player_controller.move_player(dash_speed, acceleration, deceleration, delta)

func update(delta: float) -> void: 
	if not timer.is_stopped():
		current_power -= power_cost * delta * 2

func exit() -> void:
	pass

func set_current_power(value):
	current_power = clamp(value, 0, max_power)
	
	Globals.ui.update_power_bar(max_power, current_power)

func _on_timer_timeout() -> void:
	dash_particles.emitting = false
	move_to_state.emit("WalkState")
