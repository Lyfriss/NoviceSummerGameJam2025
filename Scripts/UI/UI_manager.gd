class_name UIManager extends Control

@export_category("Screens")
@export var game_over_screen : MarginContainer
@export var health_bar : ProgressBar
@export var power_bar : ProgressBar

func _init() -> void:
	Globals.ui = self
	if not visible: 
		visible = true
		

func _ready() -> void:
	game_over_screen.visible = false

func show_game_over_screen() -> void:
	game_over_screen.visible = true

func update_health_bar(max_health : float, current_health : float) -> void: 
	var percentage = (current_health / max_health) * 100
	health_bar.value = percentage
	
func update_power_bar(max_power : float, current_power : float) -> void: 
	var percentage = (current_power / max_power) * 100
	power_bar.value = percentage
