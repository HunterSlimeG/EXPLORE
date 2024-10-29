extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
var controllers = Input.get_connected_joypads()
var empty = []
signal settings_data(content)
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if controllers != empty:
		Globals.speed = 550
	var data = Data.load_data(save_path)
	if data.fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Screens/Main.tscn")


func _on_button2_pressed():
	$Settings.visible = true
	$PanelContainer.visible = true
	var data = Data.load_data(save_path)
	settings_data.emit(data)
func _on_button3_pressed():
	get_tree().quit()


func scoreReset() -> void:
	var data = {"current":0,"high":0}
	Data.save_data(data, score_path)
