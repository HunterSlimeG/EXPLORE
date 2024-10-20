extends Node2D
var save_path = Data.save_path
var score_path = Data.score_path
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(save_path)
	if data.tutorials == false:
		$"Tutorial Labels".visible = true
	else:
		$"Tutorial Labels".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		get_tree().quit()
