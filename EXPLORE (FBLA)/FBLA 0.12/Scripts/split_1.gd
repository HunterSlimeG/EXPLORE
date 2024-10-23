extends Node2D

@onready var left = $"Room Left"
@onready var right = $"Room Right"
@onready var up = $"Room Up"

var roomTurn = preload("res://Scenes/Room_Turn.tscn").instantiate()
var roomChest = preload("res://Scenes/Room_Chest.tscn").instantiate()
var roomTurnV = preload("res://Scenes/Room_Turn_V.tscn").instantiate()
var roomChestV = preload("res://Scenes/Room_Chest_V.tscn").instantiate()
var roomT = preload("res://Scenes/Room_T.tscn").instantiate()
var roomCross = preload("res://Scenes/Room_Cross.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_room_left_room_send(r: Variant, rs: Variant) -> void:
	if r:
		if r == rs[2]:
			print("test")
			$"../Split 2/Room Left".spawn = true
			$"../Split 2/Room Up".spawn = true
		if r == rs[1]:
			$"../Split 2/Room Up".spawn = true
		if r == rs[0]:
			$"../Split 2/Room Up".spawn = false
			$"../Split 2/Room Left".spawn = false
