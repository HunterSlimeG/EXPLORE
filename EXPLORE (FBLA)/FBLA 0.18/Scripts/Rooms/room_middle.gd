extends Node2D

@export var spawn = false
var roomStr = preload("res://Scenes/Rooms/Room_Straight.tscn").instantiate()
var roomCross = preload("res://Scenes/Rooms/Room_Cross.tscn").instantiate()
var rooms = [roomStr, roomCross]
var room


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rooms = [roomStr, roomCross]
	room = rooms.pick_random()
	print(room)
	add_child(room)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
