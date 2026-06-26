extends CharacterBody3D

const MAX_GRAVITY = 900.0

@export var camera: BabyCam

var accumulation_speed: float = 0.22

var spin_speed: float = 0

func _ready() -> void:
	pass

func spin()->void:
	
	rotation.y += spin_speed

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("move_left","move_right","move_forward","move_backward") 
	
	var world_front = Vector3(camera.basis.z.x, 0.0, camera.basis.z.z).normalized()
	var right = camera.basis.x.normalized()
	
	var in_dir3d := camera.nest.transform.basis * Vector3(dir.x, 0, dir.y).normalized()
	
	
	
	#in_dir3d = in_dir3d.rotated(Vector3.UP, camera.global_rotation.y)
	#in_dir3d = in_dir3d.rotated(Vector3.RIGHT, camera.global_rotation.x)
	#in_dir3d = in_dir3d.rotated(Vector3.FORWARD, camera.global_rotation.z)
	#in_dir3d = in_dir3d.normalized()
	#velocity.y -= 1
	
	if in_dir3d:
		spin_speed += dir.y * 0.02
		velocity += in_dir3d * accumulation_speed #(right * dir.x  + world_front * dir.y) * accumulation_speed
	else:
		velocity.x = move_toward(velocity.x, 0, delta)
		velocity.z = move_toward(velocity.z, 0, delta)
		spin_speed = move_toward(spin_speed, 0, delta * 0.5)
	# i wanna raycast at velocity direction & bounce boyoyoing......
	
	move_and_slide()
	
	spin()
