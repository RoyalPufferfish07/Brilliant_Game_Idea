extends Node

@onready var hunger = 100
var dead = true
@export var starvation = 0.1
var confused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead:
		hunger -= starvation
		print(hunger)
	if hunger > 100:
		hunger = 100
	if hunger <= 0:
		print("dead")
		dead = true
		get_tree().change_scene_to_file("res://main_menu.tscn")
		hunger = 100
	if Global.confused:
		get_tree().create_timer(0.25).timeout.connect(refresh)
func refresh():
	confused = false
