extends Area3D
class_name Laser

const OFF_SCREEN := Vector3(0, 0, 200)

const IMPACT_FLASH = preload("res://Scenes/VFX/ImpactFlash/ImpactFlash.tscn")

@onready var impact_point: Marker3D = $ImpactPoint
@onready var life_timer: LifeTimer = $LifeTimer


@export var damage: int = 10
@export var speed: float = 80.0


func _ready() -> void:
	stop()


func blow_up() -> void:
	SignalHub.spawn.emit(global_position, IMPACT_FLASH)
	stop()


func _physics_process(delta: float) -> void:
	translate(Vector3.FORWARD * speed * delta)


# Transform contains Basis + Origin (4 Vectors)
# Basis has Rotation, Scale, Shear
func start(p_tr: Transform3D) -> void:
	# Orthogonal = axes are perpendicular
	# Normalized = length of every axis is 1.0
	var bas: Basis = p_tr.basis.orthonormalized() # allows it to only represent rotations
	global_transform = Transform3D(bas, p_tr.origin)
	
	SpaceUtils.toggle_area3d(self, true)
	set_physics_process(true)
	life_timer.start_timer()
	show()


func stop():
	global_position = OFF_SCREEN
	SpaceUtils.toggle_area3d(self, false)
	set_physics_process(false)
	hide()


func _on_area_entered(_area: Area3D) -> void:
	blow_up()


func _on_body_entered(_body: Node3D) -> void:
	blow_up()


func _on_life_timer_time_out() -> void:
	stop()













