extends KinematicBody2D

export var horizontal: bool = true
export var vertical: bool = false
export var reverse_horizontal: bool = false
export var reverse_vertical: bool = false

export var h_distance: int = 40
export var v_distance: int = 20

var backwards = false

export var speed: float = 1

onready var start_pos = position

onready var h_forward = start_pos.x + h_distance
onready var h_back = start_pos.x - h_distance
onready var v_forward = start_pos.y + v_distance
onready var v_back = start_pos.y - v_distance

onready var tween = $Tween
var positions

func _ready():
	$AnimationPlayer.play("gear_spin")
	$Panel/VBoxContainer/Horizontal.pressed = horizontal
	$Panel/VBoxContainer/Vertical.pressed = vertical
	$Panel/VBoxContainer/Reverse.pressed = reverse_horizontal
	$Panel/VBoxContainer/Reverse2.pressed = reverse_vertical
	for child in $Panel/VBoxContainer.get_children():
		child.connect("toggled", self, "_update_configs", [child.name])
	
	calculate_positions()
	_start_tween()


func _start_tween():
	tween.remove_all()
	tween.interpolate_property(self, "position", 
		positions[0], positions[1], speed,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()

func _reverse_tween(_object, _key):
	print("reverse reverse")
	positions.invert()
	_start_tween()

func calculate_positions():
	var x1 = h_back
	var x2 = h_forward
	var y1 = v_back
	var y2 = v_forward
	
	if not horizontal:
		x1 = start_pos.x
		x2 = start_pos.x
	if not vertical:
		y1 = start_pos.y
		y2 = start_pos.y
	if reverse_horizontal:
		var t = x1
		x1 = x2
		x2 = t
	if reverse_vertical:
		var t = y1
		y1 = y2
		y2 = t
	
	positions = [Vector2(x1, y1), Vector2(x2, y2)]

func _update_configs(pressed: bool, property: String):
	if property == "Horizontal":
		horizontal = pressed
	elif property == "Vertical":
		vertical = pressed
	elif property == "Reverse":
		reverse_horizontal = pressed
	elif property == "Reverse2":
		reverse_vertical = pressed
	
	tween.stop_all()
	position = start_pos


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT && event.pressed:
			$Panel.visible = not $Panel.visible
			tween.stop_all()
			position = start_pos
			if not $Panel.visible:
				calculate_positions()
				_start_tween()
