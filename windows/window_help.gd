@tool
extends Window


@onready var menu: Tree = %Menu
@onready var contents: MarginContainer = %Contents


func _ready() -> void:
	_init_menu()
	_set_all_contents_unvisible()


func _init_menu() -> void:
	var tree_dict := {
		"教程": {
			"建立浮動視窗": "TutorialCreateFloatingWindow",
		},
		"說明": {
			"字體": "ManualFonts",
			"關於": "ManualAbout",
		},
	}
	var tree_item_list: Array[TreeItem]= [menu.create_item()]
	var dict_list: Array[Dictionary] = [tree_dict]
	while not dict_list.is_empty():
		var tree_item := tree_item_list.pop_front() as TreeItem
		var dict := dict_list.pop_front() as Dictionary
		for key in dict:
			var _tree_item := tree_item.create_child()
			_tree_item.set_text(0, key)
			var value = dict[key]
			if value is Dictionary:
				tree_item_list.append(_tree_item)
				dict_list.append(value)
			else:
				_tree_item.set_meta("content", value)


func _set_all_contents_unvisible() -> void:
	for content in contents.get_children():
		content.visible = false


func _on_menu_item_selected() -> void:
	var item := menu.get_selected()
	if not item.has_meta("content"):
		return
	_set_all_contents_unvisible()
	var node_path := item.get_meta("content") as NodePath
	var node := contents.get_node(node_path)
	if node:
		node.set("visible", true)
