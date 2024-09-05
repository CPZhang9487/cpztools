extends Node


var _is_moving := false:
	set(value):
		if _is_moving == value:
			return
		_is_moving = value
		var window := get_window()
		$Window.visible = _is_moving
		window.always_on_top = true


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_is_moving = event.pressed


func _ready() -> void:
	var window := get_window()
	window.position = Vector2.ZERO
	window.size = $Icon.size


func _physics_process(delta: float) -> void:
	var window := get_window()
	if _is_moving:
		window.position = DisplayServer.mouse_get_position() - Vector2i.ONE * 32
