extends CanvasLayer

static var image = load("res://graphics/tiny-spaceships/tiny_ship5.png")
func set_health(amount):
	print("ui: " + str(amount))
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
