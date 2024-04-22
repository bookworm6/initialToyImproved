extends Node
var numJumps
var highestLocationReached
var falling
var flyScene

# Called when the node enters the scene tree for the first time.
func _ready():
	flyScene = preload("res://fly.tscn")
	numJumps=0
	highestLocationReached = $Camera2D.get_global_position().y
	$SpawnTimer.start()

func _physics_process(delta):
	$Camera2D.global_position.y = $player.get_global_position().y-$Camera2D/FallingPoint.get_position().y
	
func _on_player_jumped():
	numJumps+=1
	$CanvasLayer/Control/jumpLabel.text = "jumps: "+str(numJumps)

func instanceFly():
	var flyInstance = flyScene.instantiate()
	flyInstance.cameraHeight = $Camera2D.get_position().y
	add_child(flyInstance)



func _on_spawn_timer_timeout():
	print("timer out")
	instanceFly()
	print("fly instanced")
	var spawnRate = ((-1*$Camera2D.get_position().y)/10000)**1.000000000000000001  #spawns per second
	$SpawnTimer.set_wait_time(1/spawnRate)
	$SpawnTimer.start()
	
	
