extends Node

var json = JSON.new()
var save_path = "C:/HSG/FBLA/Saves/Settings.json"
var score_path = "C:/HSG/FBLA/Saves/Score.json"
var dir_paths = ["C:/HSG/","C:/HSG/FBLA/","C:/HSG/FBLA/Saves/"]

var data = {}
var tutorials = true
var fullscreen_on = false
var	display_fps = false
var	max_fps = 60
var brightness = 50
var	master_vol = 100
var	music_vol = 100
var	sfx_vol = 100
var mouse_sens = 1
var text_size = 0

func save_data(content, path):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	file.close()
	
func load_data(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	return content
	
func create_file():
	if not FileAccess.file_exists(save_path):
		for i in dir_paths.size():
			DirAccess.make_dir_absolute(dir_paths[i])
		var content = {
		"tutorials" : true,
		"fullscreen_on" : false,
		"display_fps" : false,
		"max_fps" : 60,
		"brightness" : 50,
		"master_vol" : 100,
		"music_vol" : 100,
		"sfx_vol" : 100,
		"mouse_sens" : 1,
		"text_size" : 0,
		}
		data = content
		save_data(data, save_path)
	else:
		pass
		
	if not FileAccess.file_exists(score_path):
		for i in dir_paths.size():
			DirAccess.make_dir_absolute(dir_paths[i])
		var data2 = {"current":0,"high":0}
		save_data(data2, score_path)
	else:
		pass
	
func _ready():
	create_file()
	
