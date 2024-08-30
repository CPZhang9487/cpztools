extends Node


var _is_moving := false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_is_moving = event.pressed


func _ready() -> void:
	var window := get_window()
	window.position = Vector2.ZERO
	window.size = $TextureRect.size


func _physics_process(delta: float) -> void:
	if _is_moving:
		get_window().position = DisplayServer.mouse_get_position() - Vector2i.ONE * 32
