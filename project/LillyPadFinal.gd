extends StaticBody2D
signal win


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset():
	pass

func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		if body.get_linear_velocity().y>0:
			win.emit()
