extends Area2D
@onready var sfx: AudioStreamPlayer2D = $SFX

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.key += 1
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimatedSprite2D.visible = false
		sfx.play()
		await get_tree().create_timer(0.5).timeout
		queue_free() # Replace with function body.
