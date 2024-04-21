extends RigidBody2D
signal jumped
var screen_size
var currently_jumping
var jump_velocity
var horizontal_velocity
var in_air
var animationFunctionWorking




# Called when the node enters the scene tree for the first time.
func _ready():
	jump_velocity=-4000
	horizontal_velocity = 4000
	animationFunctionWorking = false
	contact_monitor = true
	max_contacts_reported = 1
	$AnimatedSprite2D.play("walk")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		currently_jumping = true
		in_air = true
		$jumpSound.play()
		apply_central_impulse(Vector2(0,jump_velocity))
		jumped.emit()
	if Input.is_action_pressed("move_left"):
		apply_central_force(Vector2(-1*horizontal_velocity,0))
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("move_right"):
		apply_central_force(Vector2(horizontal_velocity,0))
		$AnimatedSprite2D.flip_h = true
		
func _integrate_forces(state):
	if Input.is_action_just_pressed("jump"):
		if in_air:
			set_linear_velocity(Vector2.ZERO)
			
		
func _process(delta):
	if animationFunctionWorking == false:
		animation()

#This is its own function because I only want the jump animation to play 
#once everytime the player jumps. If this is in the process function, than it does not 
#finish running before process runs again (at least that is my theory), which messes up the animation 
func animation():
	animationFunctionWorking=true
	if currently_jumping==true:
		$AnimatedSprite2D.play("jump")
	elif in_air==true:
		$AnimatedSprite2D.play("in air")
	animationFunctionWorking = false


func _on_animated_sprite_2d_animation_finished():
	if currently_jumping==true:
		currently_jumping=false


func _on_body_entered(body):
	if body.get_name() == "floor":
		if in_air==true:
			currently_jumping = false
			in_air = false
			$AnimatedSprite2D.play("land")
			$landSound.play()
