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
		#yield timeout(0.5)
		

		self.visible = false
		$collectSound.play()
		yield($collectSound, "finished")
		
		self.position = Global.pos_offset # remove from scene
		Global.updateLbl = "Status: power up collected!"
		Global.power_ups += 1
		Global.score += 5
		print("action pressed end")
		self.queue_free()

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		print(self.get_global_position())
		$description.visible = true
		player_entered = true


func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		# print("buddy left")
		$description.visible = false
		player_entered = false

func _on_actionBtn_pressed():
	print("action pressed")
	actionBtn_pressed = true







