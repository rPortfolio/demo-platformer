extends CharacterBody2D


const SPEED = 128

var jump_height: int = 64
var gravity: int = (2 * jump_height) / (0.4 ** 2)
var jump_velocity: int = -sqrt(2 * gravity * jump_height)

signal player_crushed


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_wall() and velocity.y > 0 and Input.get_axis("ui_left", "ui_right") != 0:
		velocity.y = 16

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_velocity

	if is_on_ceiling() and is_on_floor():
		player_crushed.emit()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
