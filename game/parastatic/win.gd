extends Control
@onready var sfx: AudioStreamPlayer2D = $SFX

var v = false
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

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn") # Replace with function body.
	Scenemanager.index = 1
	Global.win = false
