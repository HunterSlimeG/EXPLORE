extends Node2D
var SPEED = 1000.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var JoyClick = InputEventMouseButton.new()
	position = get_global_mouse_position()
	#if Input.is_action_pressed("Interact"):
		#$Cursor.play("default")
		#JoyClick.button_index = MOUSE_BUTTON_LEFT
		#JoyClick.position = get_viewport().get_mouse_position()
		#JoyClick.pressed = true
		#Input.parse_input_event(JoyClick)

func _input(event: InputEvent) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction: Vector2
	direction.y = Input.get_axis("Up2", "Down2")
	direction.x = Input.get_axis("Left2", "Right2")
	var movement = SPEED * direction * delta
	if (movement):
		get_viewport().warp_mouse(get_global_mouse_position()+movement)
