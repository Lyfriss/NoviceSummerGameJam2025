class_name HitBox extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var prompt_transition_speed : float = 8

var in_range : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		in_range = true
		animation_player.play("Prompt", -1, prompt_transition_speed)

func _process(_delta: float) -> void:
		if not Globals.player.is_illuminated() and Input.is_action_just_pressed("interact") and in_range:
			Globals.player.dash_state.current_power += 20
			get_parent().get_parent().queue_free()
	
func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController: 
		in_range = false
		animation_player.play("Prompt", -1, -prompt_transition_speed, true)
