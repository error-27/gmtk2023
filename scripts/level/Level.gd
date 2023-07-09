extends Node2D

export var finish_line: NodePath
onready var finish = get_node(finish_line)

export var next_lvl_num: int = 1
export(String, FILE, "*.tscn,*.scn") var next_lvl
export var player: NodePath

func _ready():
	(finish as Area2D).connect("body_entered", self, "transition_next_lvl")

func transition_next_lvl(body):
	if body == get_node(player):
		var intro_res = preload("res://scenes/level/LevelIntro.tscn")
		var intro = intro_res.instance()
		intro.level_num = next_lvl_num
		intro.next_lvl = next_lvl
		get_viewport().add_child(intro)
		queue_free()
