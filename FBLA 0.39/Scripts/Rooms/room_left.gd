extends Node2D

var block = preload("res://Scenes/Rooms/Room_Block.tscn").instantiate()
var blockV = preload("res://Scenes/Rooms/Room_Block_Up.tscn").instantiate()
var roomTurn = preload("res://Scenes/Rooms/Room_Turn.tscn").instantiate()
var roomChest = preload("res://Scenes/Rooms/Room_Chest.tscn").instantiate()
var roomT = preload("res://Scenes/Rooms/Room_T.tscn").instantiate()

var roomEmpty = preload("res://Scenes/Rooms/Room_Empty.tscn").instantiate()

var roomCross = preload("res://Scenes/Rooms/Room_Cross.tscn").instantiate()
var roomChestV = preload("res://Scenes/Rooms/Room_Chest_v.tscn").instantiate()
var roomTurnV = preload("res://Scenes/Rooms/Room_Turn_V.tscn").instantiate()

var rooms = [roomChest, roomTurn, roomT]
var room
var rooms_end = [roomChest, roomEmpty]
var rooms_up = [roomChestV, roomTurnV, roomCross]
var room_up2
var room_up5

signal roomSend(r, rs)
func _ready() -> void:
	spawn(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn(s: bool) -> void:
	#print(str(room.name)+"--"+str(self))
	
	room = rooms.pick_random()
	add_child(room)
	roomTurnV.scale.x *= [1, -1].pick_random()
	room_up2 = rooms_up.pick_random()
	roomTurnV.scale.x *= [1, -1].pick_random()
	room_up5 = rooms_up.pick_random()
	if room.name == "Room T":
		$"../../Split 2/Room End".add_child(rooms_end.pick_random())
		$"../../Split 2/Room Up".add_child(room_up2)
	elif room.name == "Room Turn":
		$"../../Split 2/Room Up".add_child(room_up2)
	elif room.name == "Room Chest":
		$"../../Split 2/Room Up".add_child(blockV)
		room_up2 = block
	else:
		room_up2 = block
	
	if room_up2.name == "Room Cross":
		$"../../Split 5/Room End".add_child(rooms_end.pick_random())
		$"../../Split 5/Room Up".add_child(room_up5)
	elif room_up2.name == "Room Turn" and room_up2.scale.x<0:
		$"../../Split 5/Room End".add_child(rooms_end.pick_random())
	elif room_up2.name == "Room Turn" and room_up2.scale.x>0:
		$"../../Split 5/Room End".add_child(rooms_end.pick_random())
	elif room_up2.name == "Room Chest V":
		$"../../Split 5/Room End".add_child(block)
		$"../../Split 5/Room Up".add_child(blockV)
	else:
		$"../../Split 5/Room End".add_child(block)
		$"../../Split 5/Room Up".add_child(blockV)
