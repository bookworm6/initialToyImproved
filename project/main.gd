extends Node
var numJumps

# Called when the node enters the scene tree for the first time.
func _ready():
	numJumps=0

func _on_player_jumped():
	numJumps+=1
	$jumpLabel.text = "jumps: "+str(numJumps)
	
	
	
