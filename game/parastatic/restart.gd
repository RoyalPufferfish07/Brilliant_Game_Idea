extends Control
@onready var sfx: AudioStreamPlayer2D = $SFX
var v = false
var level_str = "res://level_"
var t = ".tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and !v:
		v = true
		sfx.play()
	if !visible and v:
		v = false


func _on_restart_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", level_str + str(Scenemanager.index)+t)
	#print("WORK")
	visible = false
