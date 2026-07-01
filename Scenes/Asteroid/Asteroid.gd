class_name Asteroid
extends Node3D

const EXPLODE_Z: float = 20

@onready var mesh: MeshInstance3D = $Icosphere
@export var spin_speed: float = 2.0
@export var speed: float = -10.0
@onready var hit_box: HitBox = $HitBox

static var asteroids_spawned: int = 0
static var asteroids_killed: int = 0

func _ready() -> void:
	spawn()

func _physics_process(delta: float) -> void:
	if global_position.z > EXPLODE_Z:
		hit_box.blow_up()
		queue_free()
	else:
		mesh.rotate(Vector3(1, 1, 0).normalized(), spin_speed * delta)
		translate_object_local(Vector3.FORWARD * speed * delta)

func spawn():
	asteroids_spawned += 1
	hide()
	await get_tree().process_frame
	show()

func _on_hit_box_died() -> void:
	asteroids_killed += 1
	queue_free()


























