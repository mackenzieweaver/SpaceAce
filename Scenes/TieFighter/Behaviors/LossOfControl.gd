class_name LossOfControl
extends EnemyBehavior

const BROKEN_TIE_SOUND = preload("res://Assets/Audio/Effects/384472__broken_tie.wav")

@export var loss_control_distance: float = 50.0
@export var loss_control_speed: float = 25.0
@export var spin_speed: float = 8.0

func setup(p_owner: TieFighter) -> void:
	super(p_owner)
	owner.engine.stream = BROKEN_TIE_SOUND

func update(delta: float) -> void:
	super(delta)
	
	var should_spin: bool = _player_ref.player_less_than_distance(
		owner.global_position,
		loss_control_distance
	)
	
	if should_spin:
		# Slow down
		speed = loss_control_speed
		# Rotate x and y
		owner.mesh.rotate(Vector3(1, 1, 0).normalized(), spin_speed * delta)
	else:
		# Only "track" player if in front of player and not already spinning
		var in_front_of_player = owner.global_position.z - _player_ref.player_z < 0
		if in_front_of_player: face_player()























