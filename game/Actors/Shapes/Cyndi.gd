extends NPC

func _ready() -> void:
	idle()


func die() -> void:
	$AnimatedSprite.play("die")
	yield($AnimatedSprite, "animation_finished")
	Events.emit_signal("cyndi_died")
	queue_free()


func idle() -> void:
	# TODO: Kill ai steering. Once the animation plays re-enable it!
	print("Stop godot-ai-steering behavior here")
	$AnimatedSprite.play("idle")
	yield($AnimatedSprite, "animation_finished")
	print("Start godot-ai-steering behavior here!")



func being_attacked(damage: int) -> void:
	hitpoints -= damage
	Events.emit_signal("cyndi_health_changed", hitpoints)
	if hitpoints < 0:
		die()


func _on_DetectPhilippos_body_entered(body: Node) -> void:
	pass
