extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
var Bat = preload("res://Scenes/Interaction/Bat.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bat.position.x = 945
	Bat.position.y = 389
	Bat.scale.x = 6
	Bat.scale.y = 6
	Bat.menu = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	data = Data.load_data(score_path)
	$Score.text = "Score: "+str(data.current)
	$Score2.text = "High Score: "+str(data.high)
	$Bat.menu = true
	$Spike.menu = true
	$Spike2.menu = true
	$Spike3.menu = true
	$Spike4.menu = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Screens/Menu.tscn")


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Screens/Main.tscn")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		Bat = load("res://Scenes/Interaction/Bat.tscn").instantiate()
		Bat.position.x = 945
		Bat.position.y = 389
		Bat.scale.x = 6
		Bat.scale.y = 6
		Bat.menu = true
		add_child(Bat)
