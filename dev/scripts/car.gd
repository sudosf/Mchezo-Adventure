extends RigidBody2D

var player_entered
var original_pos

var option_selected
var answer

var can_interact = true

var actionBtn_pressed: bool = false

func _ready():
	$description.visible = false
	original_pos = self.position
	# print(original_pos)

func _process(delta):
	if !can_interact:
		$description.rect_position = Vector2(8000, 8000)
		return
		
	# activate next question
	if (Input.is_action_just_pressed("action") or actionBtn_pressed or Global.action_pressed) and player_entered:
		actionBtn_pressed = false
		Global.action_pressed = false
		$description.visible = false
		# self.visible = false
		# self.position = Vector2(5000, 5000) # remove from scene
		
		if option_selected == answer:
			Global.updateLbl = "Correct, well done!"
			Global.questions_complete += 1
			Global.score += 10
			
			Global.reset_station()
		else:
			Global.score += -1.25 # 2.5 points (digit error)
			Global.updateLbl = "Sorry, that's incorrect (-2.5 points)" 
		
		can_interact = false
		player_entered = false
		Global.q3_complete = true
		
		
func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		if can_interact:
			$description.visible = true
			
		option_selected = $answer.text
		answer = Global.correct_answer
		player_entered = true

func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		$description.visible = false
		player_entered = false


func _on_actionBtn_pressed():
	actionBtn_pressed = true
