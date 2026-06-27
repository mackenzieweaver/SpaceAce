@tool
extends EditorScript

func _run() -> void:
	var editor_selection = EditorInterface.get_selection()
	var selected_nodes = editor_selection.get_selected_nodes()
	
	for node in selected_nodes:
		if node is not MeshInstance3D: return
		var parent: Node3D = node.get_parent()
		var rb := RigidBody3D.new()
		parent.add_child(rb)
		
		rb.name = node.name + "_RigidBody"
		rb.collision_layer = 1 << 4 
		rb.collision_mask = 0
		rb.gravity_scale = 0.0
		
		rb.position = node.position
		node.position = Vector3.ZERO
		
		var cs := CollisionShape3D.new()
		cs.name = node.name + "_Collision"
		cs.shape = node.mesh.create_convex_shape()
		cs.transform = node.transform
		
		parent.remove_child(node)
		rb.add_child(node)
		rb.add_child(cs)
		
		node.owner = parent
		cs.owner = parent
		rb.owner = parent

























