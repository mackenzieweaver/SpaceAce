class_name TieFighter extends Node3D

@export var stay_still: bool = false
@export var enemy_behavior: EnemyBehavior

@onready var engine: AudioStreamPlayer3D = $Engine
@onready var blast: AudioStreamPlayer3D = $Blast
@onready var player_ref: LinkPlayer = $PlayerRef

func _ready() -> void:
	if enemy_behavior:
		enemy_behavior.setup(self)

func _physics_process(delta: float) -> void:
	# Behavior defined by resource
	if enemy_behavior:
		enemy_behavior.update(delta)
