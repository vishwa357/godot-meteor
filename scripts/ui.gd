extends CanvasLayer

var score : int = 0
static var image = load("res://graphics/tiny-spaceships/tiny_ship5.png")

func _ready():
	score = 0
	$MarginContainer/Label.text = str(score)

func set_health(amount):
	print("ui: " + str(amount))
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)


func _on_score_timer_timeout():
	score += 1
	$MarginContainer/Label.text = str(score)
	Global.score = score
