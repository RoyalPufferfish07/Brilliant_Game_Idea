extends CharacterBody2D

const SPEED = 300.0
@export var randomstrength = 30
@export var shakefade = 5
@onready var random = RandomNumberGenerator.new()
var shake_strength = 0
@onready var camera_2d: Camera2D = $Camera2D
@onready var spaceguy: Sprite2D = $Spaceguy


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Debug"):
		Global.hunger = 10000000000000000
		Global.hunger_limit = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if !Global.confused:
		#print("!!!!!CONFUSe")
		spaceguy.modulate = Color(1,1,1)
		if direction:
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
	if Global.confused:
		#print("CONFUSe")
		spaceguy.modulate = Color(0,1,0)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakefade * delta)
		camera_2d.offset = randomoffset()

func apply_shake():
	shake_strength = randomstrength
func randomoffset():
	return Vector2(random.randf_range(-shake_strength,shake_strength),random.randf_range(-shake_strength,shake_strength))
