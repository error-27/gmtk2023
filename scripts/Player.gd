extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var jump_height = -180
export(int) var move_speed = 150
export(int) var floor_friction = 20
export(int) var jump_in_air = -45

onready var animator = $AnimationPlayer

func _ready():
	$Panel/VBoxContainer/JumpHeight.connect("value_changed", self, "update_jump")
	$Panel/VBoxContainer/JumpHeight.value = -jump_height
	$Panel/VBoxContainer/WalkSpeed.connect("value_changed", self, "update_speed")
	$Panel/VBoxContainer/WalkSpeed.value = move_speed

# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	if input.x > 0:
		$Sprite.flip_h = false
	elif input.x < 0:
		$Sprite.flip_h = true
	
	if input.x == 0:
		apply_friction()
		animator.stop()
		if is_on_floor(): $Sprite.frame = 0
	else:
		apply_acceleration(input.x)
		if is_on_floor(): animator.play("run")
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = jump_height
			animator.stop()
	else:
		if Input.is_action_just_released("Jump") and velocity.y < jump_in_air:
			velocity.y = jump_in_air
			
		if velocity.y > 6:
			velocity.y += 4
		$Sprite.frame = 5
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += 4
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, floor_friction)
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, move_speed * amount, 20)

# Control panel thing lmao
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT && event.pressed:
			$Panel.visible = not $Panel.visible

func update_jump(to):
	jump_height = -to

func update_speed(to):
	move_speed = to
