extends RigidBody2D

var player_entered
var original_pos

var actionBtn_pressed: bool = false

func _ready():
	$description.visible = false
	original_pos = self.position
	# print(original_pos)

func _process(delta):
	toggle_lamp()
	
	# activate next queation
	if (Input.is_action_just_pressed("action") or actionBtn_pressed or Global.action_pressed) and player_entered:
		actionBtn_pressed = false
		Global.action_pressed = false
		$lampSound.play()
		yield($lampSound, "finished")
		Global.lamp_active = false
		Global.arrow_active = false
		$description.visible = false
		set_next_qn()
		Global.curr_question_set = true
		player_entered = false
		
		
func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		# print("buddy found us")
		$description.visible = true
		player_entered = true

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		# print("buddy left")
		$description.visible = false
		player_entered = false

func set_next_qn():
	Global.qn_type = "Mission"
	Global.update_qnLbl()

func toggle_lamp():
	if Global.lamp_active:
		self.visible = true
		self.position = original_pos
	else: 
		# offest lamp position
		self.visible = false
		self.position = original_pos + Vector2(1000, 1000)


func _on_actionBtn_pressed():
	actionBtn_pressed = true
