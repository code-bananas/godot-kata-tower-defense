extends Node

signal enemy_counted()

func count_enemy():
	print("Counting Enemies")
	enemy_counted.emit()
