extends Node3D
class_name ShadedWall


@onready var mesh: MeshInstance3D = $Mesh
@onready var player_ref: LinkPlayer = $PlayerRef


@export var check_distance_y: bool = false


var _max_distance: float = 15.0
var _distance_to_player: float = 0.0
var _wall_material: ShaderMaterial


func _ready() -> void:
	_wall_material = mesh.material_override as ShaderMaterial


func _physics_process(_delta: float) -> void:
	var player_position_of_axis = player_ref.player_y if check_distance_y else player_ref.player_x
	var global_position_of_axis = global_position.y if check_distance_y else global_position.x
	
	_distance_to_player = abs(player_position_of_axis - global_position_of_axis)
	var strength: float = clampf((_max_distance - _distance_to_player) / _max_distance, 0.0, 1.0)
	_wall_material.set_shader_parameter("strength", strength)
