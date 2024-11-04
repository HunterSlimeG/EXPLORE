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

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Interact"):
		$Area2D.input_pickable = false
		play("default")
