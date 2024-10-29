extends CharacterBody2D


var SPEED = Globals.speed
var health = 100
var score = 0
var save_path = Data.score_path
var data = {"high":0, "current":0}
var highScore = 0

signal scoreSignal()

func _ready() -> void:
	Globals.player = self
	data = Data.load_data(save_path)
	highScore = data.high
	
func _physics_process(delta: float) -> void:
	var directiony := Input.get_axis("Up", "Down")
	var directionx := Input.get_axis("Left", "Right")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta: float) -> void:
	if health <= 0:
		death()

func damage(dmg) -> void:
	health -= dmg
	$HUD/HealthBar.value = health
	
func heal(val) -> void:
	health += val
	if health > 100:
		health = 100
	$HUD/HealthBar.value = health
	
func scoreChange(val) -> void:
	score += val
	$HUD/Score.text = "Score: "+str(score)
	data.current = score
	emit_signal("scoreSignal")

func death() -> void:
	data.current = score
	Data.save_data(data, save_path)
	get_tree().change_scene_to_file("res://Scenes/Screens/Death.tscn")

func win():
	if score > highScore:
		highScore = score
	data.current = score
	data.high = highScore
	Data.save_data(data, save_path)
