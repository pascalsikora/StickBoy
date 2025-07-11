extends CharacterBody2D

const SPEED = 200
const JUMP_VELOCITY = -400
const GRAVITY = 1000

func _physics_process(delta):
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED

	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY

	move_and_slide()
