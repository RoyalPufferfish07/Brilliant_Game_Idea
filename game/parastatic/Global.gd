extends Node

var win = false
@onready var hunger = 100
var dead = true
@export var starvation = 0.1
var confused = false
var hunger_limit = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead:
		hunger -= starvation
		#print(hunger)
	if hunger > 100 and hunger_limit:
		hunger = 100
	if hunger <= 0:
		print("dead")
		dead = true
		get_tree().change_scene_to_file("res://main_menu.tscn")
		hunger = 100
	if Global.confused:
		get_tree().create_timer(0.5).timeout.connect(refresh)
	if win:
		get_tree().change_scene_to_file("res://win.tscn")
func refresh():
	confused = false
