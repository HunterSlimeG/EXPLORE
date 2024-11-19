extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
var bats = 0
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
	if event.is_action_pressed("Up"):
		bats = 1
	if event.is_action_pressed("Down") and bats==1:
		bats = 2
	if event.is_action_pressed("Left") and bats==2:
		bats = 3
	if event.is_action_pressed("Right") and bats==3:
		bats = 4
	if event.is_action_pressed("a") and bats==4:
		bats = 5
	if event.is_action_pressed("b") and bats==5:
		bats = 6
	if event.is_action_pressed("a") and bats==6:
		bats = 7
	if event.is_action_pressed("b") and bats==7:
		bats = 8
	if event.is_action_pressed("_") and bats==8:
		bats = 9
	if event.is_action_pressed("Interact") and bats==9:
		Bat = load("res://Scenes/Interaction/Bat.tscn").instantiate()
		Bat.position.x = 945
		Bat.position.y = 389
		Bat.scale.x = 6
		Bat.scale.y = 6
		Bat.menu = true
		add_child(Bat)
