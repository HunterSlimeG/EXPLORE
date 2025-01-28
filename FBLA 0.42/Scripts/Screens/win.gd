extends Node2D

var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	data = Data.load_data(score_path)
	$Score.text = "Score: "+str(data.current)
	$Score2.text = "High Score: "+str(data.high)
	$Artifact.menu()
	$Spike.menu = true
	$Spike2.menu = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Screens/Menu.tscn")


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Screens/Main.tscn")


func _on_timer_timeout() -> void:
	$Artifact.menu()


func _on_artifact_finished() -> void:
	$Timer.start()
