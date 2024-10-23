extends Node2D
@export var spawn = false
var roomTurn = preload("res://Scenes/Room_Turn_V.tscn").instantiate()
var roomChest = preload("res://Scenes/Room_Chest_V.tscn").instantiate()
var roomT = preload("res://Scenes/Room_T.tscn").instantiate()
var roomCross = preload("res://Scenes/Room_Cross.tscn").instantiate()
var rooms = [roomChest, roomTurn, roomCross]
var nums = [1, -1]
var room
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	room = rooms.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if spawn:
		roomTurn.scale.x *= nums.pick_random()
		print(room)
		add_child(room)
