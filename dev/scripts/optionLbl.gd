extends Area2D

var player_entered

var option_selected
var answer

var actionBtn_pressed: bool = false

func _ready():
	$description.visible = false
	print($answer.text)

func _process(delta):
	
	# collect power-ups
	if (Input.is_action_just_pressed("action") or actionBtn_pressed)and player_entered:
		actionBtn_pressed = false
		$description.visible = false
		self.visible = false
		self.position = Vector2(5000, 5000) # remove from scene
		
		if option_selected == answer:
			Global.updateLbl = "Correct, well done!"
			Global.q2_complete = true
			Global.questions_complete += 1
			Global.score += 10
			Global.q2_attempts = 0
			player_entered = false
			
			Global.reset_station()
		else:
			Global.updateLbl = "Sorry, that's incorrect"
			if Global.q2_attempts >= 1:
				Global.score -= 2.5
				Global.updateLbl = "Sorry, that's incorrect (- 2.5 points)" 
		
		Global.q2_attempts += 1
		self.queue_free()
		player_entered = false

func _on_optionLbl_body_entered(body):
	if body.get_name() == "Player":
		$description.visible = true
		option_selected = $answer.text
		answer = Global.correct_answer
		player_entered = true


func _on_optionLbl_body_exited(body):
	if body.get_name() == "Player":
		$description.visible = false
		player_entered = false


func _on_actionBtn_pressed():
	actionBtn_pressed = true





