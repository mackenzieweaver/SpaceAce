class_name TieExplosionEffect
extends Node3D

signal finished

func _ready() -> void:
	$Sparks.emitting = true

func _on_sparks_finished() -> void:
	finished.emit()
