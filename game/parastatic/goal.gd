extends Area2D
var level_str = "res://level_"
var t = ".tscn"
var win_level = 6

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !Global.dead and Scenemanager.index < 7 and !Global.win and !Global.complete:
		#$CollisionShape2D.set_deferred("disabled", true)
		#sfx.play()
		#body.invicible()
		#await sfx.finished
		Scenemanager.index += 1
		Global.complete = true
		Global.reset_hunger()
		
	if body.is_in_group("Player") and Scenemanager.index >= 7:
		Global.win = true
		Global.complete = false
