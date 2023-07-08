extends Camera2D

export var subject_path: NodePath

onready	var subject = get_node(subject_path)

func _process(delta):
	var s_pos = subject.position
	var new_pos = lerp(position, s_pos, 0.1)
	position = new_pos
