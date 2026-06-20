extends Node


signal spawn(pos: Vector3, scn: Spawner.SceneNames)
func emit_spawn(): spawn.emit()


signal laser(p_tr: Transform3D, laser_type: Spawner.LaserTypes)
func emit_laser(): laser.emit()

