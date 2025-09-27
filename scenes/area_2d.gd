extends Area2D

var my_label: Label
var scorep1 = 0
var scorep2 = 0

func _ready() -> void:
	my_label = $Label

func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	
	if area.name == "a1":
		scorep1 += 1
	elif area.name == "a2":
		scorep2 += 1
	my_label.text = "Player Red Score: " + str(scorep1) + " " + "Player Blue Score: " + str(scorep2)
