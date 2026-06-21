extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var rotation_speed: float = 1.0

func _process(delta):
	# Rotating the parent node automatically orbits all children
	rotate_y(rotation_speed * delta)
