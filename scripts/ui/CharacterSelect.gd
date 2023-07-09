extends Control

func _ready():
	$ColorRect/AnimationPlayer.play("pulse")

func _selected():
	var intro_res = preload("res://scenes/level/LevelIntro.tscn")
	var intro = intro_res.instance()
	intro.level_num = 1
	intro.next_lvl = "res://scenes/level/Demo1.tscn"
	get_viewport().add_child(intro)
	queue_free()
