extends Marker2D

@export var spawn_interval_min_seconds:float = 2
@export var spawn_interval_max_seconds:float = 3
@export var enemies:Array[PackedScene] = []

@export var spawn_enemy_speed_min:float = 100
@export var spawn_enemy_speed_max:float = 250

signal enemy_destroyed()

func _ready():
	_spawn_enemy()

func _spawn_enemy():
	var enemy_scene = enemies.pick_random()
	var enemy = enemy_scene.instantiate()
	
	enemy.speed = randf_range(spawn_enemy_speed_min, spawn_enemy_speed_max)
	
	enemy.destroyed.connect(_on_enemy_destruction)
	add_child(enemy)
	
	get_tree().create_timer(randf_range(spawn_interval_min_seconds, spawn_interval_max_seconds)).timeout.connect(_spawn_enemy)

func _on_enemy_destruction():
	enemy_destroyed.emit()
