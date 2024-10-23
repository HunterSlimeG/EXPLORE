extends Node2D
@export var spawn = false
var roomTurn = preload("res://Scenes/Room_Turn.tscn").instantiate()
var roomChest = preload("res://Scenes/Room_Chest.tscn").instantiate()
var roomT = preload("res://Scenes/Room_T.tscn").instantiate()
var rooms = [roomChest, roomTurn, roomT]
var room 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	room = rooms.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if spawn:
		roomTurn.scale.x *= -1
		roomT.scale.x *= -1
		roomChest.scale.x *= -1
		rooms = [roomChest, roomTurn, roomT]
		print(room)
		add_child(room)
