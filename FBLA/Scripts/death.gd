extends Node2D
var save_path = "C:/HSG/Saves/Settings.json"
var score_path = "C:/HSG/Saves/Score.json"
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(score_path)
	$Score.text = "Score: "+str(data.current)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
