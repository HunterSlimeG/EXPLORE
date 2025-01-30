class_name Hurtbox
extends Area2D
var process = false
var hitbox : Hitbox
var cooldown = true
func _init():
	collision_layer = 0
	collision_mask = 2
	
func _process(delta: float) -> void:
	if process:
		if owner.has_method("bat") and hitbox.owner.has_method("bat"):
			pass
		else:
			if hitbox == null:
				return
			elif cooldown and hitbox.type == 1:
				if owner.has_method("damage"):
						owner.damage(hitbox.value)
				$Timer.start()
				cooldown = false

func _ready():
	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)
	$Timer.connect("timeout", self.on_cooldown)
	
func _on_area_entered(h: Hitbox):
	process = true
	hitbox = h
	if owner.has_method("bat") and hitbox.owner.has_method("bat"):
		pass
	else:
		if hitbox == null:
			return
		elif hitbox.type == 2:
			if hitbox.owner.has_method("score"):
				hitbox.owner.score()
			if owner.has_method("scoreChange"):
				owner.scoreChange(hitbox.value)
	
func _on_area_exited(h: Hitbox):
	process = false
	cooldown = true
	hitbox = h
	
func on_cooldown():
	cooldown = true
