extends PanelContainer
var save_path = Data.save_path
var score_path = Data.score_path
var data = Data.load_data(save_path)
var fullscreen_on : bool
var tutorials : bool
var res = [1280, 720]
var bats : bool
var night : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(save_path)
	if !data.has("version") || data.version>Globals.ver:
		var content = Data.load_data("res://Scripts/Data/Default_Settings.json")
		Data.save_data(content, save_path)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func act(v:bool):
	data = Data.load_data(save_path)
	if v:
		visible = true
		$"../PanelContainer".visible = true
	$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.selected = data.fullscreen_on
	$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = $TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.get_item_index(data.res[1])
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.button_pressed = !data.bats
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Hard.button_pressed = data.night
	$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = data.tutorials
	
func _on_save_pressed() -> void:
	data.fullscreen_on = fullscreen_on
	data.tutorials = tutorials
	data.res = res
	data.bats = bats
	data.night = night
	Data.save_data(data, save_path)
	apply()


func apply() -> void:
	act(false)
	if data.res:
		var resVect = Vector2(data.res[0], data.res[1])
		DisplayServer.window_set_size(resVect)
	if data.fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_close_pressed() -> void:
	visible = false
	$"../PanelContainer".visible = false


func _on_Fullscreen_item_selected(index: int) -> void:
	if index == 0:
		fullscreen_on = false
	if index == 1:
		fullscreen_on = true


func _on_tutorials_toggled(toggled_on: bool) -> void:
	tutorials = toggled_on

func _on_resolution_item_selected(index: int) -> void:
	if index == 0:
		res = [854, 480]
	if index == 1:
		res = [1280, 720]
	if index == 2:
		res = [1920, 1080]
	if index == 3:
		res = [2560, 1440]


func _on_chiroptophobia_toggled(toggled_on: bool) -> void:
	bats = !toggled_on


#func _on_option_button_item_selected(index: int) -> void:
	#if index == 0:
		#data.lang = "English"
	#if index == 1:
		#data.lang = "Spanish"


func _on_hard_toggled(toggled_on: bool) -> void:
	night = toggled_on


func _on_settings_pressed() -> void:
	act(true)
