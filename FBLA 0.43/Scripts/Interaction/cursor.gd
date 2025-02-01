extends Node2D
@export var SPEED = 1000.0
var animation = "default"
var mouse = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position()
	Input.set_custom_mouse_cursor($Cursor.sprite_frames.get_frame_texture($Cursor.animation, $Cursor.frame))
	#print(Input.get_current_cursor_shape())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		$Cursor.play(animation)
	if event is InputEventMouseMotion:
		if Input.get_current_cursor_shape() == Input.CURSOR_POINTING_HAND:
			pointer()
		if Input.get_current_cursor_shape() == Input.CURSOR_ARROW:
			arrow()

func _physics_process(delta: float) -> void:
	var direction: Vector2
	direction.y = Input.get_axis("Up2", "Down2")
	direction.x = Input.get_axis("Left2", "Right2")
	var movement = SPEED * direction * delta
	if (movement):
		Input.warp_mouse(get_global_mouse_position()+movement)

func pointer():
	animation = "hand"
	$Cursor.animation = "hand"

func arrow():
	animation = "default"
	$Cursor.animation = "default"
	
func click():
	var JoyClick = InputEventMouseButton.new()
	JoyClick.button_index = MOUSE_BUTTON_LEFT
	JoyClick.pressed = true
	
