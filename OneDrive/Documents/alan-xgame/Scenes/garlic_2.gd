extends Node2D
@onready var player: CharacterBody2D = $"../player"
@onready var self_area = $Area2D
@onready var player_area = $"../player/Area2D"

signal garlic_collected

func _process(delta: float) -> void:
	if player_area.overlaps(self_area):
		if self.visible:
			emit_signal("garlic_collected")
			self.hide()
