extends StaticBody2D

var hopsLeft
var disapeared
# Called when the node enters the scene tree for the first time.
func _ready():
	hopsLeft = 2
	disapeared = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_exited(body):
	if body is RigidBody2D:
		if body.justJumped == true:
			hopsLeft-=1
			if hopsLeft<=0:
				$CollisionShape2D.set_deferred("disabled",true)
				disapeared = true
				$AnimationPlayer.play("disapear")

func reset():
	hopsLeft = 2
	if disapeared == true:
		show()
		$CollisionShape2D.set_deferred("disabled",false)
		$AnimationPlayer.play("apear")
		disapeared = false
		
		
	
