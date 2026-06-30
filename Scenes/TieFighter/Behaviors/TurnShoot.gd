class_name TurnShoot
extends EnemyBehavior

@export var engage_distance: float = 100.0

var _engaged: bool = false

func update(delta: float) -> void:
	super(delta)
	
	var _within_distance = _player_ref.player_less_than_distance(
		owner.global_position,
		engage_distance
	)
	
	if !_engaged and _within_distance:
		face_player()
		shoot_burst()
		_engaged = true























