extends CharacterBody2D

var speed=150
var jump=0
var jump_velo=400
var high=0
var floor=0

	
func _physics_process(delta: float):
	#JUMP#
	
	if Input.is_action_pressed("jump") and jump <21:
		
		jump +=1
		position.y -= delta*jump_velo
		high-=0.5
		if high <=-3:
			$car.position.y = -3
			floor=0
		else:
			$car.position.y +=high*delta
	#DOWN#
	if floor==1:
		jump=0
		$car.position.y= 0
		
	else:
		position.y += delta*100 
		if (Input.is_action_just_released("jump") and jump>0 and jump <21) or jump==20 :
			high+=0.5
			if high >=3:
				$car.position.y = 3
				
			else:
				$car.position.y +=high*delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	floor=1
