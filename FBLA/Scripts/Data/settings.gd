extends PanelContainer
var save_path = "C:/HSG/Saves/Settings.json"
var score_path = "C:/HSG/Saves/Score.json"
var data = {
	"fullscreen_on" : false,
	"display_fps" : false,
	"max_fps" : 60,
	"brightness" : 50,
	"master_vol" : 100,
	"music_vol" : 100,
	"sfx_vol" : 100,
	"mouse_sens" : 1,
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
		$TabContainer/Video/MarginContainer/Fullscreen._select_int(1)
	else:
		$TabContainer/Video/MarginContainer/Fullscreen._select_int(0)
func _on_save_pressed() -> void:
	Data.save_data(data, save_path)


func _on_apply_pressed() -> void:
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
