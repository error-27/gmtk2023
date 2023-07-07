extends RigidBody2D


var held: bool = false
onready var snap_area: Area2D = get_parent().get_parent().get_node("ButtonHints").get_node(name).get_node(name)

# Immobilize when clicked
func _pressed():
	held = true
	mode = MODE_STATIC

# Mobilize when unclicked
func _let_go():
	held = false
	mode = MODE_RIGID
	apply_central_impulse(Input.get_last_mouse_speed() * 2)

# Change positions and such, and piece things back together when needed
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
		if abs(global_position.y - snap_area.global_position.y) < 10 and abs(global_position.x - snap_area.global_position.x) < 20:
			snap_area.get_parent().modulate.a = 0
			get_parent().get_parent().get_node("Buttons").get_node(name + "Button").disabled = false
			get_parent().get_parent().get_node("Buttons").get_node(name + "Button").modulate.a = 1
			queue_free()
