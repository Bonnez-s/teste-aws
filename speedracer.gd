extends Node2D

var pos_0
var speed=150
var jump=0
var rotate=0
var jump_velo=400

func _ready():
	pos_0=position.y
	
func _process(delta):
	move(delta)
	
func move(delta):
	position.x +=delta * speed
	#JUMP#
	if Input.is_action_pressed("jump") and jump <21:
		jump +=1
		position.y -= delta*jump_velo
		rotate -=1
		if rotate <=-12:
			rotate=-12
		$car.rotation =rotate*delta
	#DOWN#
	if Input.is_action_just_released("jump") or jump>=21:
		if position.y>pos_0:
			position.y += delta*0.8
			rotate +=1
			if rotate >=12:
				rotate=12
			$car.rotation =rotate *delta
		else:
			jump=0
			position.y<=pos_0
			rotate -=1
			if rotate <=0:
				rotate=0
			$car.rotation =rotate*delta
			
	#ACELL/DESACELL#
	if Input.is_action_pressed("acelerate"):
		speed=8
	if Input.is_action_pressed("desacelarete"):
		speed=3
	if Input.is_action_just_released("acelerate") or Input.is_action_just_released("desacelarete"):
		speed=3
