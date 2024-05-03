extends CanvasLayer

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)
	$GameOverSound.play()

func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
