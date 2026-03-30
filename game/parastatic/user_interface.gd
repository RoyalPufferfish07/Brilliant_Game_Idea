extends CanvasLayer

@onready var progress_bar: ProgressBar = $"User Interface/ProgressBar"
@onready var antiodote_timer_label: Label = $"User Interface/AntiodoteTimerLabel"
@onready var antidote_timer: Timer = $AntidoteTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_bar.value = Global.hunger
	var rounded_time = round(antidote_timer.time_left * 10) / 10
	antiodote_timer_label.text = "Time To Win:" + str(rounded_time)


func _on_antidote_timer_timeout() -> void:
	Global.win = true # Replace with function body.
