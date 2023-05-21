extends Node2D

onready var option = preload("res://dev/scenes/comp/optionLbl.tscn")

var player_entered

var q2_original_pos 
var q3_original_pos 

var timer = Timer.new()
var timer_started = false

func _ready():
	# $Area2D/q2_city.queue_free()
	Global.arrow_follow = $lamp.position
	
	q2_original_pos = $q2_city.rect_position
	$q2_city.rect_position = Global.pos_offset
	# $q2_city.visible = false
	
	q3_original_pos = $q3_car.rect_position
	$q3_car.rect_position = Global.pos_offset
	$q3_car.visible = false
	
	timer.connect("timeout",self,"finish_q2")
	timer.wait_time = 1
	timer.one_shot = true
	add_child(timer)
	
	# set_q2()
	
func _process(delta):
	
	# if Global.questions_complete == 2:
	if Global.q2_complete:
		for opt in Global.q2_instance:
			print("showing del 1")
			if is_instance_valid(opt):
				opt.queue_free()
		
		if !timer_started:
			timer.start()
			timer_started = true

	# landmark question
	if (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("action") or Global.action_pressed) and player_entered:
		Global.action_pressed = false
		Input.action_release("action")
		if Global.curr_question_num == 1:
			Global.updateLbl = "Status: landmark found!"
			Global.score += 10
			player_entered = false
			Global.questions_complete += 1
			$q1_landmark.disconnect("body_entered", self, "_on_q1_landmark_body_entered")
			
			Global.reset_station()
			Global.curr_question_num = 2
			set_q2()
		
		elif Global.curr_question_num == 2:
			pass

func set_q2():
	var opt_data = [
		{ "ans": "Jozi", "pos": Vector2(1000, 1000)},
		{ "ans": "Durban", "pos": Vector2(1500, 1000)},
		{ "ans": "Karoo", "pos": Vector2(1500, 1300)},
		{ "ans": "creg", "pos": Vector2(1000, 1300)}
	]
	
	for obj in opt_data:
		var opt_init = option.instance()
		opt_init.get_node("answer").text = obj['ans']
		opt_init.position = obj['pos']
		add_child(opt_init)
		Global.q2_instance.push_back(opt_init)

func set_q3():
	$q3_car.rect_position = q3_original_pos
	$q3_car.visible = true

func finish_q2():
	print("showing del 2")
	Global.q2_complete = false
	Global.reset_station()
	set_q3()

func _on_q1_landmark_body_entered(body):
	if Global.curr_question_set:
		print(body.get_name())
		if body.get_name() == "Player":
			print("buddy found us")
			player_entered = true


func _on_q1_landmark_body_exited(body):
	if body.get_name() == "Player":
		print("buddy left")
		player_entered = false
