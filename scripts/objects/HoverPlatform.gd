extends KinematicBody2D

export var horizontal: bool = true
export var vertical: bool = false
export var reverse_horizontal: bool = false
export var reverse_vertical: bool = false

var dir: Vector2 = Vector2.ZERO

onready var timer = $Timer

export var speed: float = 1

onready var start_pos = position

func _ready():
	$AnimationPlayer.play("gear_spin")
	$Panel/VBoxContainer/Horizontal.pressed = horizontal
	$Panel/VBoxContainer/Vertical.pressed = vertical
	$Panel/VBoxContainer/Reverse.pressed = reverse_horizontal
	$Panel/VBoxContainer/Reverse2.pressed = reverse_vertical
	for child in $Panel/VBoxContainer.get_children():
		child.connect("toggled", self, "_update_configs", [child.name])

func _process(delta):
	if $Panel.visible:
		return
	var reversal_h = 1 if not reverse_horizontal else -1
	var reversal_v = 1 if not reverse_vertical else -1
	dir = Vector2(reversal_h * int(horizontal) * timer.time_left / timer.wait_time, reversal_v * int(vertical) * timer.time_left / timer.wait_time)
	move_and_collide(dir * speed)


func _on_Timer_timeout():
	speed *= -1

func _update_configs(pressed: bool, property: String):
	if property == "Horizontal":
		horizontal = pressed
	elif property == "Vertical":
		vertical = pressed
	elif property == "Reverse":
		reverse_horizontal = pressed
	elif property == "Reverse2":
		reverse_vertical = pressed
	
	position = start_pos
	timer.start(timer.wait_time)


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT && event.pressed:
			$Panel.visible = not $Panel.visible
			position = start_pos
			if $Panel.visible:
				timer.start(timer.wait_time)
