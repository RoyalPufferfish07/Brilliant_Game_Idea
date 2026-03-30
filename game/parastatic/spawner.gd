extends Node2D

@onready var random = RandomNumberGenerator.new()
const BAD_FOOD = preload("uid://mktu5xe5tead")
const FOOD = preload("uid://djx3ifv82wbi2")
var who_name = FOOD
var wat_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = 0
	while i < 100:
		who_will_spawn()
		were_will_spawn()
		spawn()
		i += 1
		#print("LOOP" + str(i) )
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var food_insta = who_name.instantiate()
	add_child(food_insta)
	food_insta.position = wat_pos
func who_will_spawn():
	var who = random.randi_range(0, 100)
	if who >= 30:
		who_name = FOOD
	if who < 29:
		who_name = BAD_FOOD
func were_will_spawn():
	var were = Vector2(random.randi_range(-5, 4)* 50,random.randi_range(-3, 3) * 50)
	wat_pos = were
