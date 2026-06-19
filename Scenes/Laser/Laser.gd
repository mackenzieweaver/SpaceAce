extends Area3D
class_name Laser


@onready var impact_point: Marker3D = $ImpactPoint


@export var damage: int = 10
@export var speed: float = 80.0


func blow_up() -> void:
	SignalHub.spawn.emit(global_position, Spawner.SceneNames.ImpactFlash)
	queue_free()


func _physics_process(delta: float) -> void:
	translate(Vector3.FORWARD * speed * delta)


func _on_area_entered(area: Area3D) -> void:
	blow_up()


func _on_body_entered(body: Node3D) -> void:
	blow_up()
