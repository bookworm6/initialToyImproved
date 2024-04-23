extends CharacterBody2D

var random
var enteranceSide
var cameraHeight
var speed
var margin = 50
var viewportEntered
var viewportWidth

func _ready():
	viewportEntered = false
	random = RandomNumberGenerator.new()
	speed = random.randf_range(50,100)
	enteranceSide = random.randi_range(1,2) #1 enters from left, 2 enters from right
	viewportWidth = ProjectSettings.get_setting("display/window/size/viewport_width")
	var viewportHeight = ProjectSettings.get_setting("display/window/size/viewport_height")
	position.y = randf_range(cameraHeight,cameraHeight-viewportHeight)
	if enteranceSide == 1:
		position.x = -1*margin
		velocity = Vector2(1,0)*speed
		scale.x = -1*scale.x
	else:
		position.x = viewportWidth+margin
		velocity = Vector2(-1,0)*speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	if viewportEntered == true:
		queue_free()

func _physics_process(delta):
	if viewportEntered ==false:
		if enteranceSide ==1:
			if position.x>margin:
				viewportEntered = true
		else:
			if position.x<viewportWidth-margin:
				viewportEntered = true
	move_and_slide()

func eaten():
	$AnimationPlayer.play("eaten")
	
	




	
