class_name Hurtbox
extends Area2D
var process = false
var hitbox : Hitbox
var cooldown = false
func _init():
	collision_layer = 0
	collision_mask = 2
	
func _process(delta: float) -> void:
	if process and cooldown:
		if owner.has_method("bat") and hitbox.owner.has_method("bat"):
			pass
		else:
			if hitbox == null:
				return
			if hitbox.type == 1:
				if owner.has_method("damage"):
					owner.damage(hitbox.value)
			if hitbox.type == 2:
				if hitbox.owner.has_method("score"):
					hitbox.owner.score()
				if owner.has_method("scoreChange"):
					owner.scoreChange(hitbox.value)
			if hitbox.type == 3:
				if owner.has_method("heal"):
					owner.heal(hitbox.value)
		cooldown = false
	
func _ready():
	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)
	$Timer.connect("timeout", self.on_cooldown)
	
func _on_area_entered(h: Hitbox):
	process = true
	$Timer.start()
	hitbox = h
	
func _on_area_exited(h: Hitbox):
	process = false
	hitbox = h
	
func on_cooldown():
	cooldown = true
