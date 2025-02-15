extends AnimatedSprite2D
var player: AnimatedSprite2D
var spawn = true
var bat = preload("res://Scenes/Interaction/Bat.tscn").instantiate()
var coin = preload("res://Scenes/Interaction/Coin.tscn").instantiate()
var artifact = preload("res://Scenes/Interaction/Artifact.tscn").instantiate()
var items = []
var pos = Vector2(0, 0)
@onready var root = $"/root/Main"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Globals.sprite
	if $"../Marker" != null:
		pos = $"../Marker".global_position
	coin.chest = pos
	bat.chest = pos
	artifact.chest = pos
	items = [bat, coin, coin, artifact]
	if Globals.hard:
		items = [bat, bat, coin, artifact]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame == 5 && spawn:
		#$StaticBody2D/CollisionShape2D.disabled = true
		spawn = false
		root.add_child(items.pick_random())
func _on_button_pressed() -> void:
		$Button.disabled = true
		play("default")
		player.play("idle")
