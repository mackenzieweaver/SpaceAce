class_name Asteroid
extends Node3D

@onready var mesh: MeshInstance3D = $Icosphere
@export var spin_speed: float = 2.0
@export var speed: float = -10.0
@onready var hit_box: HitBox = $HitBox


func _physics_process(delta: float) -> void:
	mesh.rotate(Vector3(1, 1, 0).normalized(), spin_speed * delta)
	#translate_object_local(Vector3.FORWARD * speed * delta)


func _on_hit_box_died() -> void:
	queue_free()
