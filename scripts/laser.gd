extends Area2D

var speed : int = 500

func _ready():
	var tween = create_tween()
	tween.tween_property($SpriteNode, "scale", Vector2(1, 1,), 0.2).from(Vector2(0, 0))

func _process(delta):
	position += Vector2(0, -1) * speed * delta
	pass
