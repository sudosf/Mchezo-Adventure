extends Control

onready var qnLbl = $Panel/question/questionLbl
onready var timerLbl = $Panel/Timer

var minutes = 0
var seconds = 5
var dsec = 0

var time_secs
var time_mins

func _ready():
	$Panel/pauseMenu.visible = false
	$Panel/toEndGameBtn.visible = false
	minutes = Global.timer_mins

func _process(delta):
	update_countdown()
	
	if Global.q3_complete:
		$Panel/toEndGameBtn.visible = true
		Global.q3_complete = false
	
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		
	if Input.is_action_pressed("action") or Global.action_pressed:
		Global.action_pressed = false
		qnLbl.visible = true
	
	if Global.is_paused:
		qnLbl.visible = false
		
	# set mission question
	qnLbl.text = Global.qn_type + ": \n" + Global.curr_question
	$Panel/updates.text = Global.updateLbl
	$Panel/score.text = "Score: " + str(Global.score)
	$Panel/powerups.text = "Power-ups: " + str(Global.power_ups)
	$Panel/questions.text = "Clues solved: " + str(Global.questions_complete) + "/" + str(Global.total_questions)

func toggle_pause():
	if Global.is_paused:
		$Panel/pauseMenu.visible = false
		Global.is_paused = false
		# $"/root/BackgroundMusic".stop()
		
	else: 
		$"/root/BackgroundMusic".play()
		$Panel/pauseMenu.visible = true
		Global.is_paused = true

func update_countdown():
	if seconds > 0 and dsec <= 0:
		seconds -= 1
		dsec = 10
	
	if minutes > 0 and seconds <= 0:
		minutes -= 1
		seconds = 60
	
	if minutes >= 10:
		time_mins = str(minutes)
	else: time_mins = "0" + str(minutes)
	
	if seconds >= 10:
		time_secs = str(seconds)
	else: time_secs = "0" + str(seconds)
	
	timerLbl.text = time_mins + " : " + time_secs
	
	if seconds == 0:
		print("time is out!")

func _on_pauseBtn_pressed():
	toggle_pause()
	

func _on_togBtn_pressed():
	if qnLbl.visible:
		qnLbl.visible = false
	else:
		qnLbl.visible = true

func _on_qnLblTimer_timeout():
	qnLbl.visible = false


func _on_playerTimer_timeout():
	dsec -= 1


func _on_toEndGameBtn_pressed():
	Global.set_gameover()
