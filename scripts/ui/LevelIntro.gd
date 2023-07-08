extends CanvasLayer

var next_lvl = "res://scenes/level/Demo1.tscn"

export var level_num: int = 0
onready var timer = $ColorRect/Timer

func _ready():
	$ColorRect/Label.text = "Level " + str(level_num)
	show()
	timer.start(2)
	yield(timer, "timeout")
	hide()
	get_tree().change_scene(next_lvl)
