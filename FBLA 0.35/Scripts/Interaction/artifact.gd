extends AnimatedSprite2D

var player: CharacterBody2D
var chest
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Globals.player
	if chest:
		position = chest



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func score():
	$Hitbox/CollisionShape2D.disabled = true
	$Hitbox2/CollisionShape2D.disabled = true
	play("default")
	$AnimationPlayer.play("new_animation")
	$Timer.start()
	$Timer2.start()
	
func _on_timer_timeout() -> void:
	$Hitbox.value = 0
	$Hitbox2.value = 0
	


func _on_timer_2_timeout() -> void:
	visible = false
	queue_free()
func menu():
	play("default")
	$AnimationPlayer.play("new_animation")
