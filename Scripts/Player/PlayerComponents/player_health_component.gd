class_name PlayerHealthComponent extends Node

@export_category("References")
@export var player : PlayerController
@export var burning_particle: GPUParticles2D
@export_category("Health settings")
@export var max_health : float = 100
@export var dps : float = 1
var current_health : float : set = set_current_health
var dead : bool = false 

func _ready() -> void: 
	current_health = max_health
	burning_particle.emitting = false

func _process(delta: float) -> void:
	burn_in_the_light(delta)

func burn_in_the_light(delta : float): 
	if player.is_illuminated() and current_health > 0:
		current_health -= dps * delta
		burning_particle.emitting = true

	if not player.is_illuminated() and current_health < max_health:
		current_health += dps * delta
		burning_particle.emitting = false
		

func set_current_health(value):
	current_health = clamp(value, 0, max_health)
	if current_health == 0:
		Globals.ui.show_game_over_screen()
		Globals.player.dead = true
	Globals.ui.update_health_bar(max_health, current_health)

func take_damege(damege : float):
	current_health -= damege
	burning_particle.emitting = true
