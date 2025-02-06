extends Node2D
@export var SPEED = 500.0
var animation = "default"
var mouse = Vector2(0, 0)
var stopped = false
var direction = Vector2.ZERO
var con: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InputHelper.device_changed.connect(deviceChange)
	arrow()
	for b in get_all_selectables(owner):
		if b.has_signal("mouse_entered") and b.has_signal("mouse_exited"):
			b.mouse_entered.connect(pointer.bind(b))
			b.mouse_exited.connect(arrow.bind(b))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	stopped = !$Cursor.is_playing()
	#position = get_window().get_mouse_position()
	if animation=="default":
		Input.set_custom_mouse_cursor($Cursor.sprite_frames.get_frame_texture($Cursor.animation, $Cursor.frame), Input.CURSOR_ARROW, Vector2(10, 10))
	elif animation=="hand":
		Input.set_custom_mouse_cursor($Cursor.sprite_frames.get_frame_texture($Cursor.animation, $Cursor.frame), Input.CURSOR_POINTING_HAND, Vector2(10, 10))
		
func deviceChange(device: String, device_index: int):
	#print(device_index)
	if device == InputHelper.DEVICE_XBOX_CONTROLLER:
		get_tree().set_group("Control Sprite", "animation", "xbox")
	elif device ==InputHelper.DEVICE_KEYBOARD:
		get_tree().set_group("Control Sprite", "animation", "keyboard")
	
func _input(event: InputEvent) -> void:
	if owner.name=="Menu":
		if event.is_action_pressed("Previous"):
			if owner.get_node("Settings/TabContainer").current_tab == 0:
				owner.get_node("Settings/TabContainer").current_tab = 2
			else:
				owner.get_node("Settings/TabContainer").current_tab -= 1
		if event.is_action_pressed("Next"):
			if owner.get_node("Settings/TabContainer").current_tab == 2:
				owner.get_node("Settings/TabContainer").current_tab = 0
			else:
				owner.get_node("Settings/TabContainer").current_tab += 1
	if event.is_action_pressed("Interact"):
		$Cursor.play(animation)
		if Input.get_current_cursor_shape()==Input.CURSOR_POINTING_HAND:
			if con is CheckBox:
				if con.button_pressed:
					con.pressed.emit()
					con.button_pressed = false
				else:
					con.pressed.emit()
					con.button_pressed = true
			elif con is OptionButton:
				con.show_popup()
			elif con is Button:
				con.pressed.emit()
	elif event.is_action_pressed("LC"):
		$Cursor.play(animation)
func _physics_process(delta: float) -> void:
	direction = Input.get_vector("Left2", "Right2", "Up2", "Down2")
	var movement = SPEED * direction * delta
	if direction and DisplayServer.window_is_focused():
		Input.warp_mouse(get_window().get_mouse_position()*get_viewport().get_screen_transform()+movement)
	else:
		movement = Vector2.ZERO

func pointer(node = self):
	con = node
	if stopped:
		animation = "hand"
		$Cursor.animation = "hand"

func arrow(node = self):
	con = node
	if stopped:
		animation = "default"
		$Cursor.animation = "default"

func get_all_selectables(node: Node):
	var nodes : Array = []
	for N in node.get_children():
		if N is Button:
			nodes.append(N)
		if N.get_child_count() > 0:
			nodes.append_array(get_all_selectables(N))
	return nodes
