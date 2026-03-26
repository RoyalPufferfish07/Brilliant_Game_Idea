extends CharacterBody2D

@export var speed = 400  
@onready var rotation_speed = rot_deafult
@export var rot_sprint = 5
@export var rot_deafult = 1.5
var sprint = false
func _physics_process(delta):
	var move_input = Input.get_axis("Down", "Up")
	var rotation_direction = Input.get_axis("Left", "Right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	if Input.is_action_just_pressed("Sprint"):
		sprint = true
	if Input.is_action_just_released("Sprint"):
		sprint = false
	if sprint:
		rotation_speed = rot_sprint
	else:
		rotation_speed = rot_deafult
