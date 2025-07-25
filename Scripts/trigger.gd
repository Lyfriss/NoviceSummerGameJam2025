class_name Trigger extends Area2D

@export var animation : AnimationPlayer
@export var animation_speed : float = 5
var is_trigered : bool = false
var war_trigered : bool = false


func _on_body_entered(_body: Node2D) -> void:
	print("HI")
	is_trigered = true

func _on_body_exited(_body: Node2D) -> void:
	is_trigered = false

func _process(_delta: float) -> void:
	if is_trigered and not war_trigered: 
		animation.play("Animation", -1, animation_speed, false)
		print("Animation player: " + str(animation.current_animation))
	
	if not is_trigered and war_trigered: 
		animation.play("Animation", -1, -animation_speed, true)
		
