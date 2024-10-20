extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func coin():
	visible = false
	$Hitbox/CollisionShape2D.disabled = true
	$Timer.start()


func _on_timer_timeout() -> void:
	$Hitbox.value = 0
