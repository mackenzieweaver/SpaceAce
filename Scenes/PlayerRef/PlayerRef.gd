extends Node
class_name LinkPlayer

var player: Player
var player_pos: Vector3
var player_x: float
var player_y: float
var player_z: float

func _ready() -> void:
	player = get_tree().get_first_node_in_group(Player.GROUP_PLAYER)

func _physics_process(_delta: float) -> void:
	player_pos = player.global_position
	player_x = player_pos.x
	player_y = player_pos.y
	player_z = player_pos.z

func player_pos_set_y(y: float) -> Vector3:
	return Vector3(player_x, y, player_z)
func direction_to_player(from: Vector3) -> Vector3:
	return from.direction_to(player_pos)
func player_too_close(from: Vector3) -> bool:
	return from.distance_to(player_pos) < 0.05
func player_less_than_distance(from: Vector3, distance: float) -> bool:
	return from.distance_to(player_pos) < distance











