extends Node2D

@onready var garlic_container: HBoxContainer = $Garlic_container
@onready var garlic: TextureRect = $Garlic_container/Garlic1
@onready var garlic2: TextureRect = $Garlic_container/Garlic2
@onready var garlic3: TextureRect = $Garlic_container/Garlic3
@onready var garlic4: TextureRect = $Garlic_container/Garlic4
@onready var garlic5: TextureRect = $Garlic_container/Garlic5
@onready var lvl: RichTextLabel = $level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)
	
	if Global.mini_games_done < 3:
		Global.mini_games_done = Global.mini_games_done + 1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.mini_games_done) + ".tscn")
		
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	
func _process(delta: float) -> void:
	match Global.lives:
		4:
			garlic.hide()
		3:
			garlic.hide()
			garlic2.hide()
		2:
			garlic.hide()
			garlic2.hide()
			garlic3.hide()
		1: 
			garlic.hide()
			garlic2.hide()
			garlic3.hide()
			garlic4.hide()
		0:
			garlic_container.hide()
			
	timer.text = str(time)
	lvl.text = "level" + str(Global.minigame_done)

func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time -= 1
	return
	
func wait(seconds: float) -> void :
	get_tree().create_timer(seconds).timeout
