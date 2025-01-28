extends PanelContainer
var save_path = Data.save_path
var score_path = Data.score_path
var data = Data.load_data(save_path)
var fullscreen_on : bool
var tutorials : bool
var res : Array
var bats : bool
var night : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	act(false)
	data = Data.load_data(save_path)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func act(v:bool):
	data = Data.load_data(save_path)
	if v:
		visible = true
		$"../PanelContainer".visible = true
	$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.set_block_signals(true)
	if data.fullscreen_on:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.selected = 1
	else:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.selected = 0
	$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.set_block_signals(false)
	$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.set_block_signals(true)
	$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = data.tutorials
	$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.set_block_signals(false)
	$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.set_block_signals(true)
	if data.res == [840, 480]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 0
	elif data.res == [1260, 720]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 1
	elif data.res == [1920, 1080]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 2
	elif data.res == [2560, 1440]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 3
	$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.set_block_signals(false)
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.set_block_signals(true)
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.button_pressed = data.bats
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.set_block_signals(false)
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Hard.set_block_signals(true)
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Hard.button_pressed = data.night
	$TabContainer/Accessibility/MarginContainer/BoxContainer/Hard.set_block_signals(false)
func _on_save_pressed() -> void:
	data.fullscreen_on = fullscreen_on
	data.tutorials = tutorials
	data.res = res
	data.bats = bats
	data.night = night
	Data.save_data(data, save_path)
	act(false)


func _on_apply_pressed() -> void:
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
		res = [840, 480]
	if index == 1:
		res = [1260, 720]
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
