extends KinematicBody2D

const speed = 150
const jump = -250
const gravity = 10
const UP = Vector2(0,-1)
var motion = Vector2()
var jump_count = 0
export var extrajump = 3



func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("ui_up") && jump_count < extrajump:
			motion.y = jump
			jump_count += 2
	if is_on_floor():
		jump_count = 0
	motion = move_and_slide(motion, UP)
	
