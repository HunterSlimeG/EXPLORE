extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0
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
	$HUD/Score2.text = "Highest Score: "+str(highScore)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
	health += heal
	$HUD/HealthBar.value = health
	
func scoreChange(val) -> void:
	score += val
	$HUD/Score.text = "Score: "+str(score)
	data.current = score
	if score > highScore:
		highScore = score
		data.high = highScore
		$HUD/Score2.text = "Highest Score: "+str(highScore)
	else:
		data.high = highScore
		$HUD/Score2.text = "Highest Score: "+str(highScore)
	emit_signal("scoreSignal")

func death() -> void:
	data = Data.load_data(save_path)
	data.current = score
	data.high = highScore
	Data.save_data(data, save_path)
	get_tree().change_scene_to_file("res://Scenes/Death.tscn")
	
