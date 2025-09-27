extends CharacterBody2D

var speed = 300
var acceleration = 0.1
signal collision(area)
signal reset(area)

func _ready():
	print("Script ready on:", self.name)
	print("Has move_left:", InputMap.has_action("drive_left"))
	print("Has move_right:", InputMap.has_action("drive_right"))
	print("Has move_up:", InputMap.has_action("drive_up"))
	print("Has move_down:", InputMap.has_action("drive_down"))
	
func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("drive_left", "drive_right", "drive_up", "drive_down")
	if dir != Vector2.ZERO:
		var input_vector = Input.get_vector("drive_left", "drive_right", "drive_up", "drive_down")
		print(input_vector)

		velocity = velocity.lerp(input_vector * speed, acceleration)
		rotation = velocity.angle() + deg_to_rad(90)
	else:
		velocity *= 0.86
	
	move_and_slide()
	
func reset_player():
	# Move back to spawn (pick your own position)
	global_position = Vector2(-4.0, -47.0)  

	# Stop motion
	velocity = Vector2.ZERO  

	# Reset other things if needed
	rotation = 90


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Starting...")
	await get_tree().create_timer(0.5).timeout
	print("After 0.5 seconds!")
	collision.emit(area)



func _on_player2_collision(area: Variant) -> void:
	
	speed += 100
	reset.emit(area)
	


func _on_player2_reset(area: Variant) -> void:
	reset_player()
