class_name EnemyExplode
extends Node3D


@export var base_velocity := Vector3(0, 0, 5)
@export var explosion_force_min := 20.0
@export var explosion_force_max := 40.0
@export var torque_applied := Vector3(1, 1, 1)
@export var cleanup_delay := 5.0


var _explosion_force: float


func _ready() -> void:
	_explosion_force = randf_range(explosion_force_min, explosion_force_max)
	explode()


func explode():
	for piece in get_children():
		if piece is not RigidBody3D: return
		var explosion_direction := Vector3(randf_range(-1, 1), randf_range(-1, 1), randf_range(.2, 1)).normalized()
		var impulse: Vector3 = explosion_direction * _explosion_force + base_velocity
		piece.constant_force = impulse / 2
		piece.constant_torque = torque_applied
	
	await get_tree().create_timer(cleanup_delay).timeout
	queue_free()
