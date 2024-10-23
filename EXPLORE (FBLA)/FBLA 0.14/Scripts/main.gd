extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Rooms/Split 1/Room Left".spawn = true
	$"Rooms/Split 1/Room Right".spawn = true
	$"Rooms/Split 1/Room Middle".spawn = true
	data = Data.load_data(save_path)
	if data.tutorials == false:
		$"Tutorial Labels".visible = true
	else:
		$"Tutorial Labels".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		get_tree().quit()









@onready var left = $"Room Left"
@onready var right = $"Room Right"
@onready var up = $"Room Up"

var roomTurn = preload("res://Scenes/Room_Turn.tscn").instantiate()
var roomChest = preload("res://Scenes/Room_Chest.tscn").instantiate()
var roomTurnV = preload("res://Scenes/Room_Turn_V.tscn").instantiate()
var roomChestV = preload("res://Scenes/Room_Chest_V.tscn").instantiate()
var roomT = preload("res://Scenes/Room_T.tscn").instantiate()
var roomCross = preload("res://Scenes/Room_Cross.tscn").instantiate()



func _on_room_left_room_send(r: Variant, rs: Variant) -> void:
	if r:
		if r == rs[2]:
			$"Rooms/Split 2/Room End".spawn = true
			$"Rooms/Split 2/Room Up".spawn = true
		if r == rs[1]:
			$"Rooms/Split 2/Room Up".spawn = true
		if r == rs[0]:
			$"Rooms/Split 2/Room Up".spawn = false
			$"Rooms/Split 2/Room End".spawn = false


func _on_room_right_room_send(r: Variant, rs: Variant) -> void:
	if r:
		if r == rs[2]:
			$"Rooms/Split 3/Room Up".spawn = true
			$"Rooms/Split 3/Room End Alt".spawn = true
		if r == rs[1]:
			$"Rooms/Split 3/Room Up".spawn = true
		if r == rs[0]:
			$"Rooms/Split 3/Room Up".spawn = false
			$"Rooms/Split 3/Room End Alt".spawn = false


func _on_room_up_room_send2(r: Variant, rs: Variant) -> void:
	if r:
		if r == rs[2]:
			$"Rooms/Split 5/Room End".spawn = true
			$"Rooms/Split 5/Room Up".spawn = true
		if r == rs[1]:
			$"Rooms/Split 5/Room Up".spawn = true
		if r == rs[0]:
			$"Rooms/Split 5/Room Up".spawn = false
			$"Rooms/Split 5/Room End".spawn = false


func _on_room_up_room_send3(r: Variant, rs: Variant) -> void:
	if r:
		if r == rs[2]:
			$"Rooms/Split 6/Room End Alt".spawn = true
			$"Rooms/Split 6/Room Up".spawn = true
		if r == rs[1]:
			$"Rooms/Split 6/Room Up".spawn = true
		if r == rs[0]:
			$"Rooms/Split 6/Room Up".spawn = false
			$"Rooms/Split 6/Room End Alt".spawn = false


func _on_room_up_room_send5(r: Variant, rs: Variant) -> void:
	pass # Replace with function body.


func _on_room_up_room_send6(r: Variant, rs: Variant) -> void:
	pass # Replace with function body.