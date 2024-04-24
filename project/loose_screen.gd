extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.fliesEaten == 1:
		$Label.text = "You ate 1 fly, but it was not enough"
	elif Global.fliesEaten == 0:
		$Label.text = "You ate no flies, so you naturally died"
	else:
		$Label.text = "You ate "+str(Global.fliesEaten)+" flies, yet it was not enough."
	$HeightLabel.text = "Height: \n"+str(Global.height)
	$RecordHeightLabel.text = "Record Height: \n"+str(Global.recordHeight)
	$AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	$ColorRect.show()
	$AnimationPlayer.play("fade_out")

func restart():
	get_tree().change_scene_to_file("res://main.tscn")
	
