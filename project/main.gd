extends Node
var numJumps
var highestLocationReached
var falling

# Called when the node enters the scene tree for the first time.
func _ready():
	numJumps=0
	highestLocationReached = $Camera2D.get_global_position().y

func _physics_process(delta):
	$Camera2D.global_position.y = $player.get_global_position().y-$Camera2D/FallingPoint.get_position().y
	
		


func _on_player_jumped():
	numJumps+=1
	$CanvasLayer/Control/jumpLabel.text = "jumps: "+str(numJumps)


