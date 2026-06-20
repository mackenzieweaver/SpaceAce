extends Node

@onready var world_environment: WorldEnvironment = $WorldEnvironment

func _process(delta: float) -> void:
	world_environment.environment.sky_rotation.y += .0075 * delta

func _on_test_timer_timeout() -> void:
	pass # Replace with function body.
