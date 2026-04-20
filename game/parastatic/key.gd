extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.key += 1
		queue_free() # Replace with function body.
