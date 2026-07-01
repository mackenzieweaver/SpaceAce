class_name ImpactFlash
extends GPUParticles3D

@onready var impact_sound: AudioStreamPlayer3D = $ImpactSound

@export var one_off: bool = true

func bang():
	impact_sound.play()
	emitting = true
	
	if one_off:
		await impact_sound.finished
		queue_free()

func _ready() -> void:
	if one_off:
		bang()

