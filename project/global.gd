extends Node

var fliesEaten
var height
var recordHeight

# Called when the node enters the scene tree for the first time.
func _ready():
	fliesEaten = 0
	height = 0
	recordHeight = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if height>recordHeight:
		recordHeight = height
