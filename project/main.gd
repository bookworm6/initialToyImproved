extends Node
var numJumps
var highestLocationReached
var falling

# Called when the node enters the scene tree for the first time.
func _ready():
	numJumps=0
	highestLocationReached = $Camera2D.get_global_position().y

func _physics_process(delta):
	if $player.get_global_position().y<highestLocationReached:
		highestLocationReached = $player.get_global_position().y
		$Camera2D.global_position.y = highestLocationReached
	if $player.get_global_position().y>$Camera2D/FallingPoint.get_global_position().y:
		falling = true
		print("falling")
	if falling==true:
		$Camera2D.global_position.y = $player.get_global_position().y+$Camera2D/FallingPoint.get_position().y
		


func _on_player_jumped():
	numJumps+=1
	$jumpLabel.text = "jumps: "+str(numJumps)


func _on_player_landed():
	falling = false
	highestLocationReached = $Camera2D.get_global_position().y
	
