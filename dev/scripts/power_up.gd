extends RigidBody2D

var player_entered

var actionBtn_pressed: bool = false

func _ready():
	$description.visible = false
	pass

func _process(delta):
	
	# collect power-ups
	if (Input.is_action_just_pressed("action") or actionBtn_pressed or Global.action_pressed) and player_entered:
		actionBtn_pressed = false
		Global.action_pressed = false
		$collectSound.play()
		self.visible = false
		self.position = Vector2(5000, 5000) # remove from scene
		Global.updateLbl = "Status: power up collected!"
		Global.power_ups += 0.5
		Global.score += 2.5

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		#print("buddy found us")
		$description.visible = true
		player_entered = true


func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		# print("buddy left")
		$description.visible = false
		player_entered = false

func _on_actionBtn_pressed():
	actionBtn_pressed = true







