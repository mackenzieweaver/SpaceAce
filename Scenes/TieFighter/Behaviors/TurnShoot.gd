class_name TurnShoot extends EnemyBehavior

@export var engage_distance: float = 100.0

var _engaged: bool = false

func update(delta: float) -> void:
	super(delta)
	
	if !_engaged:
		var _within_distance = _player_ref.player_less_than_distance(
			owner.global_position,
			engage_distance
		)
		if _within_distance:
			face_player()
			_engaged = true























