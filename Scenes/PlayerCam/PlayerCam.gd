extends Camera3D


@onready var player_ref: LinkPlayer = $PlayerRef
@export var offset: Vector3 = Vector3(0, 6, 15)
@export var camera_follow_speed: Vector2 = Vector2(18.0, 26.0)


func _physics_process(delta: float) -> void:
	var target_position = player_ref.player_pos + offset
	var delta_x: float = abs(target_position.x - global_position.x)
	var delta_y: float = abs(target_position.y - global_position.y)
	var speed: float = camera_follow_speed.x if delta_x > delta_y else camera_follow_speed.y
	global_position = global_position.move_toward(target_position, speed * delta)

