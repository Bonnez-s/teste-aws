extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D2.position =$speedracer.position  


func _on_node_2d_2_body_entered(body):
	if body is CharacterBody2D:
		var rota=get_node("Node2D2").rotation_degrees
		var y=tan(rota)*body.position.x
		body.rotation=rota
	
