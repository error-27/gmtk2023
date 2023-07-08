extends KinematicBody2D

var velocity = Vector2.ZERO

export(int) var jump_height = -180
export(int) var move_speed = 150
export(int) var floor_friction = 20
export(int) var jump_in_air = -45


# warning-ignore:unused_argument
func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
	
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = jump_height
		else:
			if Input.is_action_just_released("Jump") and velocity.y < jump_in_air:
				velocity.y = jump_in_air
			
			if velocity.y > 6:
				velocity.y += 4
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += 4
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, floor_friction)
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, move_speed * amount, 20)
