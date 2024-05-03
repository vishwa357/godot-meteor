extends CharacterBody2D

var speed : int = 150
var isLaserReady : bool = true

signal laser(pos : Vector2)

func _ready():
	position = Vector2(100, 100)

func _process(_delta):
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * speed
	move_and_slide()

	# shoot input
	if Input.is_action_just_pressed("shoot") && isLaserReady:
		isLaserReady = false
		laser.emit($LaserStartPos.global_position)
		$LaserTimer.start()
		$LaserSound.play()


func _on_laser_cooldown_timer_timeout():
	isLaserReady = true
