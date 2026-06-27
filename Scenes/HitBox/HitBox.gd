@tool
class_name HitBox extends Area3D
signal died

@onready var collision_shape: CollisionShape3D = $CollisionShape3D
@export var shape_resource: Shape3D
@export var start_health: int = 100

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
	died.emit()
	_dead = true
	SpaceUtils.toggle_area3d(self, false)

func blow_up():
	print('blow_up')

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

























