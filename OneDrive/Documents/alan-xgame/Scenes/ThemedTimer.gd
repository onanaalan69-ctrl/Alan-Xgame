extends Node2D

@onready var timer: RichTextLabel = $timer

var time: float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10))

func Timer(start_timer: float):
	time = start_timer
	
	while time > 0.10:
		await wait(0.10)
		time = time - 0.10
		
		return
		
func wait(seconds: float):
	get_tree().create_timer(seconds).timeout
