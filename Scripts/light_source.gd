class_name LightSource extends Area2D
@onready var ray_cast: RayCast2D = %RayCast2D

var in_range : bool = false
var no_obstacle : bool = false
var was_visible : bool = false
var player: PlayerController

func _ready() -> void:
	player = Globals.player

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController: 
		in_range = true


func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		in_range = false

		
func _process(_delta: float) -> void:
	if in_range: 
		ray_cast.look_at(player.global_position + Vector2(0, -8))
		no_obstacle = ray_cast.get_collider() is PlayerController
	
	var is_visible : bool = in_range and no_obstacle
	if is_visible and not was_visible:
		player.illuminated_count += 1
	elif not is_visible and was_visible :
		player.illuminated_count -= 1  
		
	was_visible = is_visible
	
