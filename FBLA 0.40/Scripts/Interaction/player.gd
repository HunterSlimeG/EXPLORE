extends CharacterBody2D


var SPEED = Globals.speed
var health = 100
var score = 0
var save_path = Data.score_path
var data = {"high":0, "current":0}
var highScore = 0
var direction: Vector2
var moveable = false
var dead = false
var stop = false
signal scoreSignal()

func _ready() -> void:
	animation("spawn", true)
	Globals.player = self
	Globals.sprite = $AnimatedSprite2D
	data = Data.load_data(save_path)
	highScore = data.high
func _physics_process(delta: float) -> void:
	if moveable:
		if direction.x > 0 || direction.x < 0 || direction.y > 0 || direction.y < 0:
			$AnimatedSprite2D.play("movement")
			stop = true
		#else:
			#if stop:
				#$AnimatedSprite2D.play("idle")
				#$AnimatedSprite2D.stop()
				#stop = false
		direction.y = Input.get_axis("Up", "Down")
		direction.x = Input.get_axis("Left", "Right")
		if direction.y:
			velocity.y = direction.y * SPEED
		else:
			velocity.y = move_toward(velocity.x, 0, SPEED)
		if direction.x:
			velocity.x = direction.x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		direction.x = abs(velocity.x)/velocity.x
		move_and_slide()
	else:
		direction = Vector2.ZERO

func animation(anim: String, play: bool):
	if !anim == "" && play == false:
		$AnimatedSprite2D.animation = anim
	elif !anim == "" && play:
		$AnimatedSprite2D.play(anim)
	else:
		pass
func _process(delta: float) -> void:
	if health <= 0 and !dead:
		$Hurtbox/CollisionShape2D.disabled = true
		$Area2D/CollisionShape2D.disabled = true
		dead = true
		death()
	if health < 0:
		health = 0
	if health > 100:
		health = 100
	if direction.x <= 0:
		$AnimatedSprite2D.flip_h = true
	elif direction.x >= 0:
		$AnimatedSprite2D.flip_h = false
		
func damage(dmg) -> void:
	$Timer3.start()
	$AnimatedSprite2D.self_modulate = "ff6464"
	if health<dmg:
		health = 0
		$HUD/HP.text = "Health: "+str(health)+"-"+str(dmg)
		$HUD/HealthBar.value = health
	elif health>0:
		health -= dmg
		$HUD/HP.text = "Health: "+str(health)+"-"+str(dmg)
		$HUD/HealthBar.value = health
	else:
		pass
	
func heal(val) -> void:
	$Timer3.start()
	$AnimatedSprite2D.self_modulate = "64ff64"
	if health<100:
		health += val
		$HUD/HP.text = "Health: "+str(health)+"+"+str(val)
		$HUD/HealthBar.value = health
	else:
		pass
	
func scoreChange(val) -> void:
	score += val
	$HUD/Score.text = "Score: "+str(score)
	data.current = score
	emit_signal("scoreSignal")

func death() -> void:
	moveable = false
	animation("death", true)
	$Timer.start()

func win():
	if score > highScore:
		highScore = score
	data.current = score
	data.high = highScore
	Data.save_data(data, save_path)


func _on_timer_timeout() -> void:
	data.current = score
	Data.save_data(data, save_path)
	get_tree().change_scene_to_file("res://Scenes/Screens/Death.tscn")


func _on_timer_2_timeout() -> void:
	moveable = true

func _input(event: InputEvent) -> void:
	pass
	#if event.is_action_pressed("Interact"):
		#animation("idle", true)


func _on_timer_3_timeout() -> void:
	$AnimatedSprite2D.self_modulate = "ffffff"
	$HUD/HP.text = "Health: "+str(health)
