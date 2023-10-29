extends Area2D

@export var speed:int = 300
@export var damage:int = 25

func _physics_process(delta):
	global_position += Vector2(speed * delta, 0)

func _on_body_entered(body):
	print(str("Missle collided with: ", body.name))
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
		
	queue_free()
		
