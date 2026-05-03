extends CharacterBody2D
var input: Vector2
const speed = 400.0
const acel = 2.0  # speed in pixels/sec
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var stop_particle: CPUParticles2D = $StopParticle

func _physics_process(delta):
	
	var player_input = get_input()
	
	if player_input.x >0: 
		sprite.flip_h = false
		stop_particle.position.x = 29.0
		stop_particle.scale.x = 1.0
	elif player_input.x <0: 
		sprite.flip_h = true
		stop_particle.position.x = -29.0
		stop_particle.scale.x = -1.0
	if player_input:
		if sprite.animation != "Walk" : sprite.play("Walk")
		sprite.speed_scale = (velocity/speed).distance_to(Vector2.ZERO)+0.5
	if !player_input and velocity.distance_to(Vector2.ZERO) < 200 and velocity.distance_to(Vector2.ZERO) > 100 :
		stop_particle.emitting = true
		if sprite.animation != "Brake" : sprite.play("Brake")
		sprite.speed_scale = (velocity/speed).distance_to(Vector2.ZERO)+0.5
	if !player_input and velocity.distance_to(Vector2.ZERO) < 100:
		if sprite.animation != "Idle" : sprite.play("Idle")
		sprite.speed_scale = 0.75
#figure out how to do a stop animation instead of just imedtiallty going to idleada
	velocity = lerp(velocity, player_input * speed, delta * acel)
	move_and_slide()
func get_input():
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	return input.normalized()
