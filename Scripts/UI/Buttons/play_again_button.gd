class_name PlayAgainButton extends Button

@export var next_level_int : int

func _on_pressed() -> void:
	Globals.change_level(next_level_int)
