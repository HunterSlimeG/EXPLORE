extends AnimatedSprite2D

var spawn = true
var bat = preload("res://Scenes/Bat.tscn").instantiate()
var coin = preload("res://Scenes/Coin.tscn").instantiate()
var items = [bat, coin]
@onready var root = $"/root/Main"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin.chest = true
	bat.chest = true
	items = [bat, coin]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame == 5 && spawn:
		#$StaticBody2D/CollisionShape2D.disabled = true
		spawn = false
		root.add_child(items.pick_random())
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Interact"):
		$Area2D.input_pickable = false
		play("default")
