extends Area2D

@export var speed : int = 150
@export var meteor_sprites : Array = [ "res://graphics/meteors/meteor2.png", "res://graphics/meteors/meteor3.png", "res://graphics/meteors/meteor4.png" ]
var speed2 : int
var dir_x : int

signal collision_meteor_player
signal collision_meteor_laser

func _ready():
	var rng := RandomNumberGenerator.new()
	var tex = meteor_sprites[rng.randi_range(0, meteor_sprites.size() - 1)]
	var sprite : Sprite2D = $Sprite2D
	sprite.texture = load(tex)

	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	speed2 = speed + rng.randi_range(-5, 5) * 10
	dir_x = rng.randi_range(-1, 1)

func _process(delta):
	position += Vector2(dir_x, 2) * speed2 * delta

func _on_body_entered(_body:Node2D):
	collision_meteor_player.emit()


func _on_area_entered(area:Area2D):
	collision_meteor_laser.emit()
	area.queue_free();
	queue_free()
