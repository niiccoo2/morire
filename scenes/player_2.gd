extends CharacterBody2D

var speed = 300
var acceleration = 0.1
signal collision(area)
signal reset(area)

func _ready():
	print("Script ready on:", self.name)
	print("Has move_left:", InputMap.has_action("drive_left2"))
	print("Has move_right:", InputMap.has_action("drive_right2"))
	print("Has move_up:", InputMap.has_action("drive_up2"))
	print("Has move_down:", InputMap.has_action("drive_down2"))
	
func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("drive_left2", "drive_right2", "drive_up2", "drive_down2")
	if dir != Vector2.ZERO:
		var input_vector = Input.get_vector("drive_left2", "drive_right2", "drive_up2", "drive_down2")
		print(input_vector)

		velocity = velocity.lerp(input_vector * speed, acceleration)
		rotation = velocity.angle()
	else:
		velocity *= 0.86
	
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

func reset_player():
	# Move back to spawn (pick your own position)
	global_position = Vector2(-17, 1)  

	# Stop motion
	velocity = Vector2.ZERO  

	# Reset other things if needed
	rotation = 0

func _on_area_2d_area_entered(area: Area2D) -> void:
	collision.emit(area)
	

func _on_player1_collision(area: Variant) -> void:
	speed += 100
	reset.emit(area)
	
func _on_player1_reset(area: Variant) -> void:
	reset_player()
