extends CharacterBody2D


const SPEED = 350.0
var dir: Vector2
var chase: bool
var player: CharacterBody2D
@export var chest = false

func _ready() -> void:
	chase = false
	player = Globals.player
	if chest:
		position = player.position
	
func move(delta):
	if chase:
		player = Globals.player
		velocity += position.direction_to(player.position) * SPEED/35
		dir.x = abs(velocity.x)/velocity.x
	elif !chase:
		velocity += dir * SPEED * delta
	move_and_slide()
	
func animation():
	if dir.x == -1:
		$Bat.flip_h = true
	else:
		$Bat.flip_h = false
		
func _process(delta: float) -> void:
	move(delta)
	animation()

func _on_timer_timeout() -> void:
	var times = [0.1, 0.5, 1.0]
	$Timer.wait_time = times.pick_random()
	if !chase:
		var dirs = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]
		dir = dirs.pick_random()

func _on_area_2d_area_entered(area: Area2D) -> void:
	chase = true
	


func _on_area_2d_area_exited(area: Area2D) -> void:
	chase = false
