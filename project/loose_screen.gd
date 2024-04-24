extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "You ate "+str(Global.fliesEaten)+" flies, yet it was not enough."
	$AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	$ColorRect.show()
	$AnimationPlayer.play("fade_out")

func restart():
	get_tree().change_scene_to_file("res://main.tscn")
	
