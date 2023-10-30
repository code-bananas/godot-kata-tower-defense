extends Area2D

@export var healthBar:ProgressBar
@export var speed:int = 3
@onready var launchSound:AudioStreamPlayer2D = $MissleLaunchSound
var canFireAgain = true

func _process(delta):
	if Input.is_key_pressed(KEY_UP):
		global_position += Vector2(0, -1) * speed
			
	if Input.is_key_pressed(KEY_DOWN):
		global_position += Vector2(0, 1) * speed		

	if Input.is_key_pressed(KEY_SPACE):
		if canFireAgain: _fire_missle()

func _on_timer_timeout():
	canFireAgain = true
	
func _on_body_entered(body):
	print(str("Station under attack!"))
	if body.is_in_group("enemy"):
		healthBar.take_damage(10)
		body.queue_free()

func _fire_missle():
	canFireAgain = false
	launchSound.play()
	
	var projectile = preload("res://Prefabs/Missle/Missle.tscn")
	var new_projectile = projectile.instantiate()
	
	new_projectile.global_position = global_position
	get_parent().add_child(new_projectile)
	
