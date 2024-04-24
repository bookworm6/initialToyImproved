extends Node
var highestLocationReached
var falling
var flyScene
var percentFull

# Called when the node enters the scene tree for the first time.
func _ready():
	flyScene = preload("res://fly.tscn")
	highestLocationReached = $player.position.y
	$SpawnTimer.start()
	percentFull=100
	Global.fliesEaten = 0
	$AnimationPlayer.play("fade_in")

func _physics_process(delta):
	$Camera2D.global_position.y = $player.get_global_position().y-$Camera2D/FallingPoint.get_position().y
	if $player.position.y<highestLocationReached:
		highestLocationReached = $player.position.y
	if $player.position.y>highestLocationReached+2000:
		$player.falling = true
	percentFull-=.03
	$CanvasLayer/Control/TextureProgressBar.value = percentFull
	if percentFull<=0:
		$CanvasLayer/Fader.show()
		$AnimationPlayer.play("fade_out_to_dead")
	Global.height = int((abs($player.position.y)-410)/100)
	$CanvasLayer/Control/HeightLabel.text = "Height: "+str(Global.height)
	
		

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
	Global.fliesEaten+=1
	if percentFull<100:
		percentFull+=6
	if percentFull>100:
		percentFull=100

func changeSceneToDead():
	get_tree().change_scene_to_file("res://loose_screen.tscn")


func _on_lilly_pad_final_win():
	$CanvasLayer/WinScreen.show()
	$AnimationPlayer.play("show_win")


func _on_win_button_pressed():
	$CanvasLayer/Fader.show()
	$AnimationPlayer.play("win_restart")

func restart():
	get_tree().reload_current_scene ( )
