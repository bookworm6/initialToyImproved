extends StaticBody2D

var disapeared

# Called when the node enters the scene tree for the first time.
func _ready():
	disapeared = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_exited(body):
	if body is RigidBody2D:
		if body.justJumped == true:
			disapeared = true
			$CollisionShape2D.set_deferred("disabled",true)
			$AnimationPlayer.play("disapear")

func reset():
	print("reset function called")
	if disapeared == true:
		show()
		$CollisionShape2D.set_deferred("disabled",false)
		$AnimationPlayer.play("apear")
		disapeared = false
		
	
	
