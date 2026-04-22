extends Area2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var sfx: AudioStreamPlayer2D = $SFX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.confused = true
		cpu_particles_2d.emitting = true
		$CollisionShape2D.set_deferred("disabled", true)
		$Parasite.visible = false
		#Global.replinish = true
		body.apply_shake()
		sfx.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()# Replace with function body.
