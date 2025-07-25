class_name Trigger extends Area2D

var animation : AnimationPlayer
@export var animation_speed_multiplier : float = 1
var trigger_canvas : CanvasLayer

var is_trigered : bool = false
var war_trigered : bool = false

func _ready() -> void:
	for child in get_children():
		if child is AnimationPlayer:
			animation = child
		if child is CanvasLayer: 
			trigger_canvas = child
			
	if trigger_canvas.visible: 
		trigger_canvas.visible = false

func _on_body_entered(_body: Node2D) -> void:
	is_trigered = true

func _on_body_exited(_body: Node2D) -> void:
	is_trigered = false

func _process(_delta: float) -> void:
	if is_trigered and not war_trigered: 
		animation.play("Animation", -1, animation_speed_multiplier, false)
	
	if not is_trigered and war_trigered: 
		animation.play("Animation", -1, -animation_speed_multiplier, true)
