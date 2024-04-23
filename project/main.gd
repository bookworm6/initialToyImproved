extends Node
var highestLocationReached
var falling
var flyScene
var fliesEaten
var percentFull

# Called when the node enters the scene tree for the first time.
func _ready():
	flyScene = preload("res://fly.tscn")
	highestLocationReached = $player.position.y
	$SpawnTimer.start()
	fliesEaten = 0
	percentFull=100

func _physics_process(delta):
	$Camera2D.global_position.y = $player.get_global_position().y-$Camera2D/FallingPoint.get_position().y
	if $player.position.y<highestLocationReached:
		highestLocationReached = $player.position.y
	if $player.position.y>highestLocationReached+2000:
		$player.falling = true
	percentFull-=.03
	$CanvasLayer/Control/TextureProgressBar.value = percentFull
	
		

func instanceFly():
	var flyInstance = flyScene.instantiate()
	flyInstance.cameraHeight = $Camera2D.get_position().y
	add_child(flyInstance)



func _on_spawn_timer_timeout():
	instanceFly()
	var spawnRate = ((-1*$Camera2D.get_position().y)/10000)**1.000000000000000001  #spawns per second
	$SpawnTimer.set_wait_time(1/spawnRate)
	$SpawnTimer.start()
	

	


func _on_reset():
	$CanvasLayer/ResetScreen.show()
	$AnimationPlayer.play("show_fell_UI")
	highestLocationReached = $player.position.y
 


func _on_button_pressed():
	$AnimationPlayer.play("hide_fell_UI")
	get_tree().call_group("objectToLandOn", "reset")
	

func _on_player_ate_fly():
	$AnimationPlayer.play("fly_eaten_progress_bar")
	fliesEaten+=1
	if percentFull<100:
		percentFull+=6
	if percentFull>100:
		percentFull=100
	
