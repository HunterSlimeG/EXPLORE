extends AnimatedSprite2D
var menu = false
var proccess = false
var data = Data.load_data(Data.save_path)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stop()
	if data.night:
		$Hitbox.value = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frame == 3 || frame == 4:
		$Hitbox/CollisionShape2D.disabled = false
	else:
		$Hitbox/CollisionShape2D.disabled = true
	if proccess:
		if frame==0||frame==6:
			play("default")


func _on_area_2d_area_entered(area: Area2D) -> void:
	proccess = true


func _on_area_2d_mouse_entered() -> void:
	if menu:
		proccess = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	proccess = false


func _on_area_2d_mouse_exited() -> void:
	proccess = false
