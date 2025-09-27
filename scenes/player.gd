extends CharacterBody2D

var speed = 300
var acceleration = 0.1

func _ready():
	print("Script ready on:", self.name)
	print("Has move_left:", InputMap.has_action("drive_left"))
	print("Has move_right:", InputMap.has_action("drive_right"))
	print("Has move_up:", InputMap.has_action("drive_up"))
	print("Has move_down:", InputMap.has_action("drive_down"))
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("drive"):
		
		var input_vector = Input.get_vector("drive_left", "drive_right", "drive_up", "drive_down")
		print(input_vector)

		velocity = velocity.lerp(input_vector * speed, acceleration)
		rotation = global_position.angle_to_point(input_vector) + deg_to_rad(90)
	else:
		velocity *= 0.75
	move_and_slide()
	

#
#extends CharacterBody2D
#
#var speed = 200
#var acceleration = 0.1
#
#func _physics_process(delta: float) -> void:
	#var input_vector = Vector2.ZERO
	#input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#input_vector = input_vector.normalized()
	#
	#velocity = velocity.lerp(input_vector * speed, acceleration)
	#move_and_slide()
	#rotation = global_position.angle_to_point(get_global_mouse_position()) + deg_to_rad(90)
#
