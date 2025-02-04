extends Node2D
@export var SPEED = 1000.0
var animation = "default"
var mouse = Vector2(0, 0)
var stopped = false
var con: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow()
	for b in get_all_selectables(owner):
		if !b.mouse_entered.is_null() and !b.mouse_exited.is_null():
			b.mouse_entered.connect(pointer.bind(b))
			b.mouse_exited.connect(arrow.bind(b))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	stopped = !$Cursor.is_playing()
	position = get_global_mouse_position()
	if animation=="default":
		Input.set_custom_mouse_cursor($Cursor.sprite_frames.get_frame_texture($Cursor.animation, $Cursor.frame), Input.CURSOR_ARROW)
	elif animation=="hand":
		Input.set_custom_mouse_cursor($Cursor.sprite_frames.get_frame_texture($Cursor.animation, $Cursor.frame), Input.CURSOR_POINTING_HAND)
		
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
				con.get_popup().show()
			elif con is Button:
				con.pressed.emit()
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left2", "Right2", "Up2", "Down2")
	var movement = SPEED * direction * delta
	if (movement):
		Input.warp_mouse(get_viewport().get_mouse_position()+movement)

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
		if N is Button || N is TabBar:
			nodes.append(N)
		if N.get_child_count() > 0:
			nodes.append_array(get_all_selectables(N))
	return nodes
