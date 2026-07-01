class_name TieFighter
extends Node3D

const TIE_BASE_BEHAVIOR = preload("res://Resources/tie_base_behavior.tres")
const TIE_LOSS_OF_CONTROL = preload("res://Resources/tie_loss_of_control.tres")
const TIE_TURN_AND_SHOOT = preload("res://Resources/tie_turn_and_shoot.tres")

const BEHAVIORS = [
	TIE_BASE_BEHAVIOR,
	TIE_LOSS_OF_CONTROL,
	TIE_TURN_AND_SHOOT,
]

@export var stay_still: bool = false
@export var enemy_behavior: EnemyBehavior

@onready var mesh: MeshInstance3D = $Pivot/TieFighter
@onready var engine: AudioStreamPlayer3D = $Engine
@onready var blast: AudioStreamPlayer3D = $Blast
@onready var player_ref: LinkPlayer = $PlayerRef
@onready var gun: Gun = $Pivot/Gun

static var ships_spawned: int = 0
static var ships_killed: int = 0


func _ready() -> void:
	ships_spawned += 1
	if !enemy_behavior:
		var random_behavior = BEHAVIORS.pick_random()
		enemy_behavior = random_behavior.duplicate(true)
	enemy_behavior.setup(self)


func _physics_process(delta: float) -> void:
	# Behavior defined by resource
	if enemy_behavior:
		enemy_behavior.update(delta)


func _on_hit_box_died() -> void:
	ships_killed += 1
	queue_free()


























