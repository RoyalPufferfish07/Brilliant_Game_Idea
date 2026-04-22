extends StaticBody2D

@onready var sfx: AudioStreamPlayer2D = $SFX

func _ready() -> void:
	visible = true
	$Gate/CollisionShape2D.disabled = false
func _on_gate_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.key >= 1:
			body.key -= 1
			$Gate/CollisionShape2D.set_deferred("disabled", true)
			$CollisionShape2D.set_deferred("disabled", true)
			visible = false
			#sfx.play()
			#await sfx.finished
			$Sprite.visible = false
			sfx.play()
			await get_tree().create_timer(0.5).timeout
			queue_free() # Replace with function body.
