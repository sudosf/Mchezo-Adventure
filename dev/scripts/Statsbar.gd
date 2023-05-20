extends Control

onready var qnLbl = $Panel/question/questionLbl

func _ready():
	$Panel/pauseMenu.visible = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()
		
	if Input.is_action_pressed("action"):
		qnLbl.visible = true
	
	if Global.is_paused:
		qnLbl.visible = false
		
	# set mission question
	qnLbl.text = Global.qn_type + ": \n" + Global.curr_question

func toggle_pause():
	if Global.is_paused:
		$Panel/pauseMenu.visible = false
		Global.is_paused = false
		$"/root/BackgroundMusic".stop()
		
	else: 
<<<<<<< HEAD
		$"/root/BackgroundMusic".play()
		$Panel/Control.visible = true
=======
		$Panel/pauseMenu.visible = true
>>>>>>> c71a59e (added 1st question quest)
		Global.is_paused = true
		


func _on_pauseBtn_pressed():
	toggle_pause()


func _on_togBtn_pressed():
	if qnLbl.visible:
		qnLbl.visible = false
	else:
		qnLbl.visible = true

func _on_qnLblTimer_timeout():
	qnLbl.visible = false
