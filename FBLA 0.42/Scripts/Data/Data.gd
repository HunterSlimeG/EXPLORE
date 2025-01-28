extends Node

var json = JSON.new()
var save_path = "user://Saves/Settings.json"
var score_path = "user://Saves/Score.json"
var dir_paths = "user://Saves/"

var data = {}

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
		DirAccess.make_dir_absolute(dir_paths)
		var content = load_data("res://Scripts/Data/Default_Settings.json")
		data = content
		save_data(data, save_path)
	else:
		pass
		
	if not FileAccess.file_exists(score_path):
		DirAccess.make_dir_absolute(dir_paths)
		var data2 = {"current":0,"high":0}
		save_data(data2, score_path)
	else:
		pass
	
func _ready():
	create_file()
	var settings = load_data(save_path)
	var settings2 = load_data("res://Scripts/Data/Default_Settings.json")
	
	for key in settings2.keys():
		if !settings.has(key):
			settings.key = settings2.get(key)
	
