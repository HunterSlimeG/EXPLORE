extends PanelContainer
var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(save_path)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if data.fullscreen_on:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.selected = 1
	else:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen.selected = 0
	if !data.tutorials:
		$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = false
	else:
		$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = true
	if data.res[0] == 854:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 0
	elif data.res[0] == 1280:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 1
	elif data.res == [1920, 1080]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 2
	elif data.res == [2560, 1440]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.selected = 3
	if data.bats:
		$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.button_pressed = false
	else:
		$TabContainer/Accessibility/MarginContainer/BoxContainer/Chiroptophobia.button_pressed = true
func _on_save_pressed() -> void:
	Data.save_data(data, save_path)


func _on_apply_pressed() -> void:
	if data.res:
		var res = Vector2i(data.res[0], data.res[1])
		DisplayServer.window_set_size(res)
	if data.fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_close_pressed() -> void:
	visible = false
	$"../PanelContainer".visible = false


func _on_Fullscreen_item_selected(index: int) -> void:
	if index == 0:
		data.fullscreen_on = false
	if index == 1:
		data.fullscreen_on = true


func _on_tutorials_toggled(toggled_on: bool) -> void:
	data.tutorials = toggled_on

func _on_resolution_item_selected(index: int) -> void:
	if index == 0:
		data.res = [854, 480]
	if index == 1:
		data.res = [1280, 720]
	if index == 2:
		data.res = [1920, 1080]
	if index == 3:
		data.res = [2560, 1440]


func _on_chiroptophobia_toggled(toggled_on: bool) -> void:
	data.bats = !toggled_on


func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		data.lang = "English"
	if index == 1:
		data.lang = "Spanish"
