extends ProgressBar

@export var max_health:int = 50
@export var auto_hide:bool = true
var cur_health:int = 50

func _ready():
	cur_health = max_health
	max_value = max_health
	visible = !auto_hide
	
	value = cur_health

func take_damage(amount):
	cur_health -= amount
	
	value = cur_health
	
	if cur_health != max_health or auto_hide == false:
		visible = true
	
func getCurrentHealth():
	return cur_health
