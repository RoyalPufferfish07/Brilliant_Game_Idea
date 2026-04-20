extends Area2D
var level_str = "res://level_"
var t = ".tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#$CollisionShape2D.set_deferred("disabled", true)
		#sfx.play()
		#body.invicible()
		#await sfx.finished
		Scenemanager.index += 1
		get_tree().call_deferred("change_scene_to_file", level_str + str(Scenemanager.index)+t)
		Global.reset_hunger()
