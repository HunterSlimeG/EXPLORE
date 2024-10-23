extends Node2D

var roomTurn = preload("res://Scenes/Room_Turn.tscn").instantiate()
var roomChest = preload("res://Scenes/Room_Chest.tscn").instantiate()
var roomT = preload("res://Scenes/Room_T.tscn").instantiate()
var chest = preload("res://Scenes/Chest.tscn").instantiate()
var rooms = [roomChest, roomTurn, roomT]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rooms = [roomChest, roomTurn, roomT]
	var room = rooms.pick_random()
	print(room)
	add_child(room)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
