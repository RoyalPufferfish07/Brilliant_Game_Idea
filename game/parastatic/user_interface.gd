extends CanvasLayer

@onready var progress_bar: TextureProgressBar = $"User Interface/ProgressBar"
@onready var antiodote_timer_label: TextureProgressBar = $"User Interface/AntiodoteTimerLabel"
@onready var antidote_timer: Timer = $AntidoteTimer
var start = false
@onready var win: Control = $Win
@onready var restart: Control = $Restart
@onready var level_complete: Control = $"Level Complete"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GreenOutline.visible = false
	win.visible = false
	restart.visible = false
	level_complete.visible = false
	$Green.visible = false # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_bar.value = Global.hunger

	if Global.replinish and !start:
		$GreenOutline.visible = true
		$Green.visible = true
		start = true
		
		get_tree().create_timer(0.5).timeout.connect(green_gone)
	#var rounded_time = round(antidote_timer.time_left * 10) / 10
	#antiodote_timer_label.value = (15-antidote_timer.time_left)*7
	#print(antiodote_timer_label.value)
	if Global.dead:
		restart.visible = true
	if Global.win:
		win.visible = true
	if Global.complete:
		level_complete.visible = true

func _on_antidote_timer_timeout() -> void:
	#Global.win = true # Replace with function body.
	pass

func green_gone():
	Global.replinish = false
	start = false
	$Green.visible = false
	$GreenOutline.visible = false
