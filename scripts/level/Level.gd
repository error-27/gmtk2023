extends Node2D

export var finish_line: NodePath
onready var finish = get_node(finish_line)

export var next_lvl_num: int = 1
export(String, FILE, "*.tscn,*.scn") var next_lvl
export var player: NodePath
export var camera: NodePath
onready var cam = get_node(camera)

func _ready():
	(finish as Area2D).connect("body_entered", self, "transition_next_lvl")
	(cam as Camera2D).limit_left = $TileMap.get_used_rect().position.x * (16*3)
	(cam as Camera2D).limit_right = $TileMap.get_used_rect().position.x * (16*3) + $TileMap.get_used_rect().size.x * (16*3)
	(cam as Camera2D).limit_top = $TileMap.get_used_rect().position.y * (16*3)
	(cam as Camera2D).limit_bottom = $TileMap.get_used_rect().position.y * (16*3) + $TileMap.get_used_rect().size.y * (16*3)

func transition_next_lvl(body):
	if body == get_node(player):
		var intro_res = preload("res://scenes/level/LevelIntro.tscn")
		var intro = intro_res.instance()
		intro.level_num = next_lvl_num
		intro.next_lvl = next_lvl
		get_viewport().add_child(intro)
		queue_free()

func _process(delta):
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene(filename)
		
