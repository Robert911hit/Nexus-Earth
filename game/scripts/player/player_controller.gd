extends CharacterBody3D
class_name PlayerController

@export var walk_speed: float = 5.0
@export var sprint_speed: float = 8.5
@export var acceleration: float = 18.0
@export var gravity: float = 24.0
@export var camera_follow_speed: float = 10.0
@export var multiplayer_actor_id: String = "local_player"

@onready var camera_pivot: Node3D = get_node_or_null("CameraPivot")

var input_enabled: bool = true
var replicated_state: Dictionary = {}

func _physics_process(delta: float) -> void:
	if not _is_locally_controlled():
		_apply_replicated_state(delta)
		return

	var movement_input := _read_movement_input()
	var target_speed := sprint_speed if Input.is_action_pressed("sprint") else walk_speed
	var desired_velocity := Vector3(movement_input.x, 0.0, movement_input.y) * target_speed

	velocity.x = move_toward(velocity.x, desired_velocity.x, acceleration * delta)
	velocity.z = move_toward(velocity.z, desired_velocity.z, acceleration * delta)

	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0.0

	move_and_slide()
	_update_camera_follow(delta)
	_capture_replicated_state()

func _read_movement_input() -> Vector2:
	if not input_enabled:
		return Vector2.ZERO

	var direction := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	return direction.normalized() if direction.length() > 1.0 else direction

func _update_camera_follow(delta: float) -> void:
	if camera_pivot == null:
		return

	camera_pivot.global_position = camera_pivot.global_position.lerp(global_position, clamp(camera_follow_speed * delta, 0.0, 1.0))

func _capture_replicated_state() -> void:
	replicated_state = serialize_player_state()

func _apply_replicated_state(delta: float) -> void:
	if replicated_state.is_empty():
		return

	var target_position: Vector3 = replicated_state.get("position", global_position)
	global_position = global_position.lerp(target_position, clamp(camera_follow_speed * delta, 0.0, 1.0))

func _is_locally_controlled() -> bool:
	return multiplayer_actor_id == "local_player" or not multiplayer.has_multiplayer_peer()

func serialize_player_state() -> Dictionary:
	return {
		"actor_id": multiplayer_actor_id,
		"position": global_position,
		"velocity": velocity,
		"is_sprinting": Input.is_action_pressed("sprint") if input_enabled else false
	}

func apply_network_state(state: Dictionary) -> void:
	replicated_state = state.duplicate(true)
