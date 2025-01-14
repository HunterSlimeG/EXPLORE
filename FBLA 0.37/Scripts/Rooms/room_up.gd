extends Node2D
@export var spawn = false
var roomTurn = preload("res://Scenes/Rooms/Room_Turn_V.tscn").instantiate()
var roomChest = preload("res://Scenes/Rooms/Room_Chest_V.tscn").instantiate()
var roomT = preload("res://Scenes/Rooms/Room_T.tscn").instantiate()
var roomCross = preload("res://Scenes/Rooms/Room_Cross.tscn").instantiate()
var block = preload("res://Scenes/Rooms/Room_Block_Up.tscn").instantiate()
var rooms = [roomChest, roomTurn, roomCross]
var nums = [1, -1]
var room
# Called when the node enters the scene tree for the first time.
signal roomSend(r, rs)
func _ready() -> void:
	roomTurn.scale.x *= nums.pick_random()
	room = rooms.pick_random()
	roomSend.emit(room, rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if spawn:
		print(str(room)+"--"+str(self))
		add_child(room)
	else:
		add_child(block)
		print("blocked--"+str(self))
