class_name EnemyBehavior
extends Resource


@export var engine_sound_distance: float = 100.0
@export var speed: float = 40.0


var _player_ref: LinkPlayer
var _can_play_engine_sound: bool = true


var owner: TieFighter:
	set(value): owner = value


func setup(p_owner: TieFighter) -> void:
	owner = p_owner
	_player_ref = owner.player_ref
	face_player()


func update(delta: float) -> void:
	if owner.stay_still: return
	
	# Move
	owner.translate(Vector3.FORWARD * speed * delta)
	
	var _within_distance = _player_ref.player_less_than_distance(
		owner.global_position,
		engine_sound_distance
	)
	
	if _within_distance:
		# Play sound
		if _can_play_engine_sound:
			owner.engine.play()
			_can_play_engine_sound = false


func face_player():
	owner.look_at(_player_ref.player_pos, Vector3.UP)


func shoot():
	owner.gun.shoot()


func shoot_burst():
	for i in range(3):
		shoot()
		await owner.get_tree().create_timer(.2).timeout
		shoot()
		await owner.get_tree().create_timer(.4).timeout






