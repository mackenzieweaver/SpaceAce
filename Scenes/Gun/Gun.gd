extends Node3D
class_name Gun


@export var debounce: float = 0.18
@export var sound_effect: AudioStream
@export var muzzles: Array[Node3D]
@export var laser_type := Spawner.LaserTypes.PlayerLaser


const GUN_FLASH = preload("res://Scenes/VFX/GunFlash/GunFlash.tscn")
@onready var effect: AudioStreamPlayer3D = $Effect


var _gun_flashes: Array[GPUParticles3D]
var _timer: float = 0.0


func shoot():
	if _timer > debounce:
		effect.play()
		for m in muzzles:
			SignalHub.laser.emit(m.global_transform, laser_type)
		for gf in _gun_flashes:
			gf.emitting = true
		_timer = 0.0


func _ready() -> void:
	effect.stream = sound_effect
	for m in muzzles:
		var gf: GPUParticles3D = GUN_FLASH.instantiate()
		m.add_child(gf)
		_gun_flashes.append(gf)


func _process(delta: float) -> void:
	_timer += delta
