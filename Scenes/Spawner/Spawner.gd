extends Node3D


class_name Spawner

const PLAYER_LASER = preload("res://Scenes/Laser/PlayerLaser.tscn")
const TIE_LASER = preload("res://Scenes/Laser/TieLaser.tscn")


enum LaserTypes {
	PlayerLaser,
	TieLaser
}


@export var x_range: Vector2 = Vector2(-20, 20)
@export var y_range: Vector2 = Vector2(-20, 20)
@export var enabled: bool = true


@onready var tie_timer: Timer = $TieTimer
@onready var asteroid_timer: Timer = $AsteroidTimer


var _player_laser_pool: LaserPool
var _tie_laser_pool: LaserPool


func on_spawn(pos: Vector3, scn: PackedScene):
	var scene = scn.instantiate()
	call_deferred("add_with_position", scene, pos)


func on_laser(p_tr: Transform3D, laser_type: Spawner.LaserTypes) -> void:
	match laser_type:
		LaserTypes.PlayerLaser: _player_laser_pool.activate_new_scene(p_tr)
		LaserTypes.TieLaser: _tie_laser_pool.activate_new_scene(p_tr)


func _ready() -> void:
	SignalHub.spawn.connect(on_spawn)
	SignalHub.laser.connect(on_laser)
	_player_laser_pool = LaserPool.new(20, PLAYER_LASER, self, "PlayerLaser")
	_tie_laser_pool = LaserPool.new(40, TIE_LASER, self, "TieLaser")


func add_with_transform(ob: Node3D, p_tr: Transform3D) -> void:
	add_child(ob)
	ob.global_transform = p_tr


func add_with_position(ob: Node3D, p_pos: Vector3) -> void:
	add_child(ob)
	ob.global_position = p_pos


func on_create_packed_scene(p_tr: Transform3D, ps: PackedScene) -> void:
	var ns = ps.instantiate()
	call_deferred("add_with_transform", ns, p_tr)


func _on_tie_timer_timeout() -> void:
	pass


func _on_asteroid_timer_timeout() -> void:
	pass
