@tool
extends EditorPlugin

const LOCAL_CONFIG_PATH = "res://addons/input_helper/plugin.cfg"





func _enter_tree():
	add_autoload_singleton("InputHelper", "res://addons/input_helper/input_helper.gd")



func _exit_tree():
	remove_autoload_singleton("InputHelper")

	
