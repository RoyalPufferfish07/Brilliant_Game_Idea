extends Node

var level_str = "res://level_"
var t = ".tscn"
var win = false
@onready var hunger = 100
var dead = true
@export var starvation = 0.1
var confused = false
var hunger_limit = true
var timer = Timer.new()
var start = false
var level_index = 1
var replinish = false
var starving = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	timer.wait_time = 1.0
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(refresh)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !dead and !win:
		hunger -= starvation
		#print(hunger)
	if hunger > 100 and hunger_limit:
		hunger = 100
	if hunger <= 0:
		#print("dead")
		dead = true
		reset_hunger()
	if Global.confused and !start:
		timer.start()
		start = true

func refresh():
	start = false
	confused = false
func reset_hunger():
	hunger = 100
