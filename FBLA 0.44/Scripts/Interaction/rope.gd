extends AnimatedSprite2D
var end: bool
signal finish()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame >= 3:
		if end:
			finish.emit()
			end = false



func _on_control_pressed() -> void:
	$Control.disabled = true
	play("default")
