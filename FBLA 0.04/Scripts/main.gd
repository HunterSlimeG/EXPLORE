extends Node2D
var save_path = "C:/HSG/Saves/Settings.json"
var score_path = "C:/HSG/Saves/Score.json"
var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(save_path)
	if data.tutorials == false:
		$"Starting Room/Tutorial Labels".visible = true
	else:
		$"Starting Room/Tutorial Labels".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		get_tree().quit()
