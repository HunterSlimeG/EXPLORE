extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
#var controllers = Input.get_connected_joypads()
var empty = []
var controllers = Input.get_connected_joypads()
signal settings_data(content)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Ver.text = "Build: "+str(Globals.ver)
	var score = Data.load_data(score_path)
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if controllers != empty:
		Globals.controller = true
		Globals.speed = 550
	var data = Data.load_data(save_path)
	if data.res:
		var res = Vector2i(data.res[0], data.res[1])
		DisplayServer.window_set_size(res)
	if data.fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Cursor.mouse = get_global_mouse_position()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Screens/Main.tscn")


func _on_button2_pressed():
	pass
func _on_button3_pressed():
	get_tree().quit()


func scoreReset() -> void:
	var data = {"current":0,"high":0}
	Data.save_data(data, score_path)


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Screens/Credits.tscn")


func _on_play_mouse_entered() -> void:
	$BG/Bag.play("top")


func _on_settings_mouse_entered() -> void:
	$BG/Bag.play("credits")



func _on_settings_mouse_exited() -> void:
	$BG/Bag.play_backwards("credits")


func _on_play_mouse_exited() -> void:
	$BG/Bag.play_backwards("top")


func _on_quit_mouse_entered() -> void:
	$BG/Bag.play("middle")


func _on_quit_mouse_exited() -> void:
	$BG/Bag.play_backwards("middle")
