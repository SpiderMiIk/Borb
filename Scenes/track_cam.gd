extends Camera3D
class_name BabyCam

@export var target : CharacterBody3D

#@onready var pitch: Node3D = $"../.."
#@onready var yaw: Node3D = $".."
@onready var nest: Node3D = $".."

@export var sensitivity: float = 0.022

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if not Input.mouse_mode == Input.MOUSE_MODE_CAPTURED: return
	if event is InputEventMouseMotion:
		nest.rotate_object_local(Vector3.RIGHT, -event.relative.y * sensitivity)
		nest.rotate_object_local(Vector3.UP, -event.relative.x * sensitivity)

func _physics_process(delta: float) -> void:
	nest.global_position = target.global_position
	# lerp to target pos + nest?
	
	# mouse target view
