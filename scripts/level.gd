extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var health : int = 3

func _ready():
	get_tree().call_group("ui", "set_health", health)

	var n : int = $Stars.get_child_count() - 1
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	var w = get_viewport().get_visible_rect().size[0]
	var h = get_viewport().get_visible_rect().size[1]
	while n >= 0:
		var star : AnimatedSprite2D = $Stars.get_child(n)
		var s : float = rng.randf_range(0.5, 2)
		star.scale = Vector2(1, 1) * s
		star.speed_scale = 1/s
		star.global_position = Vector2(rng.randi_range(0, w), rng.randi_range(0, h))
		n -= 1

func _on_meteor_collision():
	$MeteorSound.play()
	health -= 1
	get_tree().call_group("ui", "set_health", health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_meteor_laser_collision():
	$MeteorSound.play()

func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	meteor.connect("collision_meteor_player", _on_meteor_collision)
	meteor.connect("collision_meteor_laser", _on_meteor_laser_collision)

func _on_player_laser(pos : Vector2):
	var laser = laser_scene.instantiate()
	$Laser.add_child(laser)
	laser.position = pos
