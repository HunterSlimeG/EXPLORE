class_name Hurtbox
extends Area2D

func _init():
	collision_layer = 0
	collision_mask = 2
	
	
	
func _ready():
	connect("area_entered", self._on_area_entered)
	
func _on_area_entered(hitbox: Hitbox):
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
