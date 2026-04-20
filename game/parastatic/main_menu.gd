extends Control




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.dead = true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	Global.dead = false
	get_tree().change_scene_to_file("res://level_1.tscn") # Replace with function body.
