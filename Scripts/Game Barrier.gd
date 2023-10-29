extends Area2D
@export var enemiesAllowedLabel:Label
@export var enemiesAllowed:int = 5

func _ready():
	enemiesAllowedLabel.text = str("Enemies Allowed: ", enemiesAllowed)

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		enemiesAllowed -= 1
		enemiesAllowedLabel.text = str("Enemies Allowed: ", enemiesAllowed)
		EnemyCounter.count_enemy()
	body.queue_free()
