extends Node2D
@export var spawn = false
var roomEmpty = preload("res://Scenes/Rooms/Room_Empty.tscn").instantiate()
var roomChest = preload("res://Scenes/Rooms/Room_Chest.tscn").instantiate()
var block = preload("res://Scenes/Rooms/Room_Block.tscn").instantiate()
var rooms = [roomChest, roomEmpty]
var room 

# Called when the node enters the scene tree for the first time.
signal roomSend(r, rs)
func _ready() -> void:
	room = rooms.pick_random()
	roomSend.emit(room, rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if spawn:
		room.scale.x *= -1
		print(str(room)+"--"+str(self))
		add_child(room)
	else:
		block.scale *= -1
		add_child(block)
		print("blocked--"+str(self))
