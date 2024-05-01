extends Area2D

var speed : int = 500

func _process(delta):
	position += Vector2(0, -1) * speed * delta
	pass
