extends Area2D

@export var healthBar:ProgressBar

 

func _on_timer_timeout():
	var projectile = preload("res://Prefabs/Missle/Missle.tscn")
	var new_projectile = projectile.instantiate()
	
	new_projectile.global_position = global_position
	get_parent().add_child(new_projectile)


func _on_body_entered(body):
	print(str("Station under attack!"))
	if body.is_in_group("enemy"):
		healthBar.take_damage(10)
		body.queue_free()
