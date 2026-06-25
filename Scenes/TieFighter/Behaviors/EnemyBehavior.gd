class_name EnemyBehavior extends Resource

@export var engine_sound_distance: float = 100.0
@export var speed: float = 40.0

var _player_ref: LinkPlayer
var _can_play_engine_sound: bool = true

var owner: TieFighter:
	set(value): owner = value

func setup(p_owner: TieFighter) -> void:
	owner = p_owner
	_player_ref = owner.player_ref

func update(delta: float) -> void:
	if !owner.stay_still:
		# Move
		owner.translate(Vector3.FORWARD * speed * delta)
		
		# Play sound
		var _within_distance = _player_ref.player_less_than_distance(
			owner.global_position,
			engine_sound_distance
		)
		if _within_distance and _can_play_engine_sound:
			owner.engine.play()
			_can_play_engine_sound = false

func face_player():
	owner.look_at(_player_ref.player_pos, Vector3.UP)








