class_name PauseMenuStat
extends HBoxContainer


@export var title: String = "Title"
@export var initial_value: String = "Value"

@onready var label_title: Label = $Title
@onready var label_value: Label = $Value


func _ready() -> void:
	label_title.text = title
	label_value.text = initial_value

func set_value_label(value):
	label_value.text = str(value)

