extends KinematicBody2D

# Constants for positions
var DEFAULT_POSITION = Vector2(0, 0)
var LEFT_POSITION = Vector2(-16, 0)
var RIGHT_POSITION = Vector2(16, 0)

# Speed and acceleration variables
var velocity = Vector2.ZERO
var acceleration = 10

func _physics_process(delta):
    # Get joystick input
    var joystick_direction = Vector2.ZERO
    if Input.is_action_pressed("move_left"):
        joystick_direction.x -= 1
    if Input.is_action_pressed("move_right"):
        joystick_direction.x += 1

    # Update velocity and position
    velocity.x = joystick_direction.x * acceleration
    move_and_slide(velocity)

    # Check if no input is given, return to default position
    if joystick_direction == Vector2.ZERO:
        position = DEFAULT_POSITION
    elif joystick_direction.x < 0:
        position = LEFT_POSITION
    elif joystick_direction.x > 0:
        position = RIGHT_POSITION
