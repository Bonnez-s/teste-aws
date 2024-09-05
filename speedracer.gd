extends CharacterBody2D


const SPEED: int = 300.0
const JUMP_VELOCITY: int = -400.0

@export_category("Variables")
@export_enum("left:-1", "stop:0","right:1") var move_direction: int = 1


func _physics_process(delta):
	
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	## Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY 
	## Sets constant movement for the player in one direction
	velocity.x = SPEED * move_direction
	move_and_slide()
