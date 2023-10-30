extends CharacterBody2D

@export var speed:int = 200
@export var healthBar:ProgressBar
@export var impactDamage:int = 10

@onready var explosion_sound:AudioStreamPlayer2D = $ExplosionSound

var _is_destroyed:bool = false

signal destroyed()

func _physics_process(delta):
	#if _is_destroyed == true: return
	velocity = Vector2(-speed, 0)
	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	for i in collision_count:
		var collision_info = get_slide_collision(i)
		var collider = collision_info.get_collider()
		
		if collider.has_method("take_damage"):
			collider.take_damage(impactDamage)
			destroy()

func take_damage(amount):
	if healthBar:
		healthBar.take_damage(amount)
		
		if healthBar.getCurrentHealth() <= 0:
			destroy()
			
func destroy():
	#explosion_sound.finished.connect(_removeScene)
	#_is_destroyed = true
	#visible = false
	#explosion_sound.play()
	destroyed.emit()
	_removeScene()

func _removeScene(): #TODO: Replace with lambda
	queue_free()
