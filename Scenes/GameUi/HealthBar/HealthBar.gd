class_name HealthBar
extends TextureProgressBar

const red = 0
const green = .333

func _ready() -> void:
	set_color()

func set_color() -> void:
	var hue = remap(value, min_value, max_value, red, green)
	var color = Color.from_hsv(hue, 1.0, 1.0, 1.0)
	tint_progress = color

func inc_health(v: int) -> void:
	value += v
	set_color()

func dec_health(v: int) -> void:
	value -= v
	set_color()















