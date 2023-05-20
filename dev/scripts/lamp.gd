extends RigidBody2D

var player_entered
var original_pos

func _ready():
	$description.visible = false
	original_pos = self.position
	# print(original_pos)

func _process(delta):
	toggle_lamp()
	
	# activate next queation
	if Input.is_action_pressed("action") and player_entered:
		set_next_qn()
		Global.lamp_active = false
		Global.arrow_active = false
		$description.visible = false
		Global.curr_question_set = true
		
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
	Global.qn_type = "Quest"
	Global.update_qnLbl()

func toggle_lamp():
	if Global.lamp_active:
		self.visible = true
		self.position = original_pos
	else: 
		# offest lamp position
		self.visible = false
		self.position = original_pos + Vector2(1000, 1000)
