extends KinematicBody2D

export var horizontal: bool = true
export var vertical: bool = false
export var reverse_horizontal: bool = false

var dir: Vector2 = Vector2.ZERO

onready var timer = $Timer

export var speed: float = 1

func _ready():
	$AnimationPlayer.play("gear_spin")
	

func _process(delta):
	var reversal = 1 if not reverse_horizontal else -1
	dir = Vector2( reversal * int(horizontal) * timer.time_left / timer.wait_time, int(vertical) * timer.time_left / timer.wait_time)
	move_and_collide(dir * speed)


func _on_Timer_timeout():
	speed *= -1
