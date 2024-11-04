extends PanelContainer
var save_path = Data.save_path
var score_path = Data.score_path
var data = {
	"tutorials" : true,
	"fullscreen_on" : false,
	"res" : [1280, 720],
	"display_fps" : false,
	"max_fps" : 60,
	"brightness" : 50,
	"master_vol" : 100,
	"music_vol" : 100,
	"sfx_vol" : 100,
	"mouse_sens" : 1,
	"text_size" : 0,
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_settings_data(content: Variant) -> void:
	data = content
	if data.fullscreen_on:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen._select_int(1)
	else:
		$TabContainer/Video/MarginContainer/VBoxContainer/Fullscreen._select_int(0)
	if !data.tutorials:
		$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = false
	else:
		$TabContainer/General/MarginContainer/VBoxContainer/Tutorials.button_pressed = true
	if data.res == [854, 480]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.select(0)
	elif data.res == [1280, 760]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.select(1)
	elif data.res == [1920, 1080]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.select(2)
	elif data.res == [2560, 1440]:
		$TabContainer/Video/MarginContainer/VBoxContainer/HSplitContainer/Resolution.select(3)
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


func _on_text_size_item_selected(index: int) -> void:
	data.text_size = index


func _on_resolution_item_selected(index: int) -> void:
	if index == 0:
		data.res = [854, 480]
	if index == 1:
		data.res = [1280, 760]
	if index == 2:
		data.res = [1920, 1080]
	if index == 3:
		data.res = [2560, 1440]
