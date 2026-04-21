extends Control

var level_str = "res://level_"
var t = ".tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_continue_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", level_str + str(Scenemanager.index)+t) # Replace with function body.
	Global.complete = false
	visible = false
