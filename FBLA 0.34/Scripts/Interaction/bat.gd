extends CharacterBody2D


const SPEED = 1.0
var health = 25
var dir: Vector2
var chase: bool
var player: CharacterBody2D
var menu = false
var moveable = true
var target
var default = "default"
var deaths = "death"
var data = Data.load_data(Data.save_path)
@export var chest = false

func _ready() -> void:
	if data.bats:
		default = "default"
		deaths = "death"
	else:
		default = "default2"
		deaths = "death2"
	$Bat.play(default)
	chase = false
	player = Globals.player
	if chest:
		position = player.position
	
func move(delta):
	if moveable:
		if menu:
			target = get_viewport().get_mouse_position()
			if position.distance_to(target) < 500:
				velocity *= .99
			else:
				velocity *= 1
			dir = dir
			velocity += position.direction_to(target)*position.distance_to(get_viewport().get_mouse_position()) * SPEED/30
			dir.x = abs(velocity.x)/velocity.x
		elif chase:
			target = player.position
			if position.distance_to(target) < 200:
				velocity *= .99
			else:
				velocity *= 1
			dir = dir
			player = Globals.player
			velocity += position.direction_to(target)*position.distance_to(player.position) * SPEED/30
			dir.x = abs(velocity.x)/velocity.x
		elif !chase:
			velocity += dir * SPEED*1000 * delta
		move_and_slide()
	
func animation():
	if dir.x == -1:
		$Bat.flip_h = true
	else:
		$Bat.flip_h = false
		
func _process(delta: float) -> void:
	if $Bat.animation=="death" and $Bat.frame==4:
		queue_free()
		visible = false
	if $Bat.animation=="death2" and $Bat.frame==5:
		queue_free()
		visible = false
	if health <= 0:
		death()
	move(delta)
	animation()

func _on_timer_timeout() -> void:
	var times = [0.1, 0.5]
	$Timer.wait_time = times.pick_random()
	if !chase:
		var dirs = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
		dir = dirs.pick_random()

func _on_area_2d_area_entered(area: Area2D) -> void:
	chase = true
	


func _on_area_2d_area_exited(area: Area2D) -> void:
	chase = false


func damage(dmg):
	$Bat.self_modulate = "ff6464"
	$Timer2.start()
	health -= dmg


func _on_timer_2_timeout() -> void:
	$Bat.self_modulate = "ffffff"

func death() -> void:
	moveable = false
	dir = Vector2.ZERO
	$Bat.play(deaths)

func bat():
	pass
