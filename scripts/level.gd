extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout():
	print("meteor..")
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)

func _on_player_laser(pos : Vector2):
	print("laser " + str(pos))
	var laser = laser_scene.instantiate()
	$Laser.add_child(laser)
	laser.position = pos
