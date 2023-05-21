extends KinematicBody2D

var speed = 350
var velocity = Vector2()

func _process(delta):
	velocity = Vector2()
	
	if Global.is_paused:
		return # disable player movement on pause screen
	
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	
	move_and_slide(velocity)
	# look_at(get_global_mouse_position())


func _on_up_pressed():
	Input.action_press("up")

func _on_right_pressed():
	Input.action_press("right")

func _on_down_pressed():
	Input.action_press("down")

func _on_left_pressed():
	Input.action_press("left")


func _on_up_released():
	Input.action_release("up")

func _on_down_released():
	Input.action_release("down")

func _on_left_released():
	Input.action_release("left")

func _on_right_released():
	Input.action_release("right")


func _on_actionBtn_pressed():
	Global.action_pressed = true
