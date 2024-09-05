extends Node


const CUBIC_11 = preload("res://fonts/Cubic_11.ttf") as FontFile


@onready var sub_viewport: SubViewport = %SubViewport
@onready var icon: Node2D = %Icon


func _ready() -> void:
	icon.draw.connect(func():
		icon.draw_circle(
			Vector2.ONE * 128,
			144,
			Color.RED,
		)
		icon.draw_circle(
			Vector2.ONE * 128,
			128,
			Color.WHITE,
		)
		icon.draw_rect(
			Rect2(0, 66, 16, 256 - 66 * 2),
			Color.RED,
		)
		icon.draw_rect(
			Rect2(240, 66, 16, 256 - 66 * 2),
			Color.RED,
		)
		icon.draw_rect(
			Rect2(66, 0, 256 - 66 * 2, 16),
			Color.RED,
		)
		icon.draw_rect(
			Rect2(66, 240, 256 - 66 * 2, 16),
			Color.RED,
		)
		icon.draw_string_outline(
			CUBIC_11,
			Vector2(0, 128),
			"CPZ",
			HORIZONTAL_ALIGNMENT_CENTER,
			256,
			110,
			16,
			Color.BLACK
		)
		icon.draw_string(
			CUBIC_11,
			Vector2(0, 128),
			"CPZ",
			HORIZONTAL_ALIGNMENT_CENTER,
			256,
			110,
			Color.BLUE
		)
		icon.draw_string_outline(
			CUBIC_11,
			Vector2(0, 200),
			"TOOLS",
			HORIZONTAL_ALIGNMENT_CENTER,
			256,
			66,
			8,
			Color.BLACK
		)
		icon.draw_string(
			CUBIC_11,
			Vector2(0, 200),
			"TOOLS",
			HORIZONTAL_ALIGNMENT_CENTER,
			256,
			66,
			Color.BLUE
		)
	)
	call_deferred("_save_icon")


func _save_icon() -> void:
	await RenderingServer.frame_post_draw
	sub_viewport.get_texture().get_image().save_png("icons/CPZToolsIcon.png")
