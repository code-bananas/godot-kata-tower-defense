extends Node2D

@onready var score_label:Label = %ScoreLabel #access as unique name option, removed the need to prepend with CanvasLayer
@onready var enemy_count_label:Label = $CanvasLayer/EnemyCountLabel
@onready var game_over_label:Label = %GameOverLabel
@export var enemys_allowed:int = 3

@onready var game_over_sound:AudioStreamPlayer2D = $GameOverSound

var points:int = 0

func _ready():
	updateScore()
	updateEnemyCounted()
	EnemyCounter.enemy_counted.connect(_on_enemy_counted)
	
func _on_enemy_destroyed():
	points += 1
	updateScore()
	
func updateScore():
	score_label.text = str("Score: ", points)

func _on_enemy_counted():
	enemys_allowed -= 1
	updateEnemyCounted()
	
	if enemys_allowed <= 0:
		_game_over()
	
func updateEnemyCounted():
	enemy_count_label.text = str("Enemys Allowed: ", enemys_allowed)

func _game_over():
	game_over_label.visible = true
	game_over_sound.play()
	
	var nodes_to_destroy = get_tree().get_nodes_in_group("destroy_on_game_over")
	for node in nodes_to_destroy:
		node.queue_free()
