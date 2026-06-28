@tool
class_name HitBox extends Area3D
signal died

@onready var collision_shape: CollisionShape3D = $CollisionShape3D
@export var shape_resource: Shape3D
@export var start_health: int = 100
@export var explosion_effect: PackedScene
@export var explosion_scene: PackedScene

var _dead: bool = false
var _current_health: int

func _ready() -> void:
	_update_components()
	_current_health = start_health

func _update_components():
	collision_shape.shape = shape_resource

func _notification(what: int) -> void:
	if what == NOTIFICATION_EDITOR_POST_SAVE:
		_update_components()

func die():
	_dead = true
	died.emit()
	SpaceUtils.toggle_area3d(self, false)

func blow_up():
	var particles = explosion_effect.instantiate() as TieExplosionEffect
	var tie_parts = explosion_scene.instantiate() as EnemyExplode
	
	add_child(particles)
	add_child(tie_parts)


func take_damage(v: int):
	if _dead: return
	
	_current_health -= v
	
	if _current_health <= 0:
		blow_up()
		die()


func _on_area_entered(area: Area3D) -> void:
	if area is Laser:
		var laser = area as Laser
		take_damage(laser.damage)

























