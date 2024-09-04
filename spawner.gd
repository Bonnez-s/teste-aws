extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Timer.timeout.connet(spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	var pos=get_parent().get_node("obs")
	var inst=preload("res://node_2d.tscn")
	var instan= inst.instantiate()
	pos.add_child(instan)
	instan.position.y = randf_range(-109, 109)
	$Timer.wait_time = randf_range(0.1 , 1)
	$Timer.start()
