class_name GameUi
extends Control

@onready var game_over: ColorRect = $GameOver
@onready var label: Label = $GameOver/VB/Label
@onready var game_over_scored: Label = $GameOver/VB/GameOverScored
@onready var press_shoot: Label = $GameOver/VB/PressShoot
@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var pause_menu: PanelContainer = $PauseMenu

@onready var asteroids_stat: PauseMenuStat = $PauseMenu/VB/VBoxContainer/AsteroidsStat
@onready var ships_stat: PauseMenuStat = $PauseMenu/VB/VBoxContainer/ShipsStat
@onready var power_ups_stat: PauseMenuStat = $PauseMenu/VB/VBoxContainer/PowerUpsStat
@onready var game_time_stat: PauseMenuStat = $PauseMenu/VB/VBoxContainer/GameTimeStat


func _ready() -> void:
	SignalHub.game_over.connect(on_game_over)
	Asteroid.asteroids_spawned = 0
	Asteroid.asteroids_killed = 0
	TieFighter.ships_spawned = 0
	TieFighter.ships_killed = 0


func _unhandled_input(event: InputEvent) -> void:
	if event is not InputEventKey: return
	
	if event.is_action_pressed("pause"):
		var paused = handle_pausing()
		if paused: update_stats()
	
	if event.is_action_pressed("shoot") and game_over.visible:
		get_tree().reload_current_scene()


func handle_pausing():
	var paused: bool = get_tree().paused
	get_tree().paused = !paused
	pause_menu.visible = !paused
	return get_tree().paused


func update_stats():
	asteroids_stat.set_value_label(
		SpaceUtils.get_percentage_string(
			Asteroid.asteroids_killed,
			Asteroid.asteroids_spawned
		)
	)
	
	ships_stat.set_value_label(
		SpaceUtils.get_percentage_string(
			TieFighter.ships_killed,
			TieFighter.ships_spawned
		)
	)
	
	game_time_stat.set_value_label(
		"%.2fs" % Player.game_time
	)


func on_game_over():
	game_over.show()





















