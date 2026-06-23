extends RefCounted
class_name LaserPool


var _scene_list: Array[Laser]
var _container: Node3D
var _packed_scene: PackedScene
var _name_prefix: String


func _init(start_scenes: int, packed: PackedScene, container: Node3D, name_prefix: String) -> void:
	_packed_scene = packed
	_container = container
	_name_prefix = name_prefix
	
	for i in range(start_scenes):
		add_new_scene()


func add_new_scene() -> Laser:
	var ns: Laser = _packed_scene.instantiate()
	if _name_prefix != "":
		ns.name = "%s_%d" % [_name_prefix, (_scene_list.size() + 1)]
	_container.add_child(ns)
	_scene_list.append(ns)
	return ns


func activate_new_scene(p_tr: Transform3D) -> void:
	for i in range(_scene_list.size()):
		var scene: Laser = _scene_list[i]
		if !scene.visible:
			scene.start(p_tr)
			return
	
	var ns: Laser = add_new_scene()
	ns.start(p_tr)













