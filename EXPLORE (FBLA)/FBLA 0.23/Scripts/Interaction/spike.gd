extends AnimatedSprite2D
var menu = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame == 0 || frame == 6:
		$Hitbox/CollisionShape2D.disabled = true
	else:
		$Hitbox/CollisionShape2D.disabled = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	play("default")


func _on_area_2d_mouse_entered() -> void:
	if menu:
		play("default")
