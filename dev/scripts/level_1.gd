extends Node2D

# onready var house = preload("res://dev/scenes/comp/house.tscn")

var player_entered

var house_positions = [
	Vector2(1000, 244),
	Vector2(422, 1000),
	Vector2(1000, 1000),
]

var q2_original_pos 

var timer = Timer.new()
var timer_started = false

func _ready():
	# $Area2D/q2_city.queue_free()
	Global.arrow_follow = $lamp.position
	
	q2_original_pos = $q2_city.rect_position
	$q2_city.rect_position = Vector2(4000, 4000)
	$q2_city.visible = false
	
	timer.connect("timeout",self,"finish_q2")
	timer.wait_time = 1
	timer.one_shot = true
	add_child(timer)
	
func _process(delta):
	
	# if Global.questions_complete == 2:
	if Global.q2_complete:
		#for opt in $q2_city.get_children():
		print("showing del 1")
		$q2_city.rect_position = Vector2(8000, 8000)
		if !timer_started:
			timer.start()
			timer_started = true

	# landmark question
	if Input.is_action_pressed("ui_accept") and player_entered:
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
	$q2_city.rect_position = q2_original_pos
	$q2_city.visible = true

func finish_q2():
	print("showing del 2")
	Global.q2_complete = false

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
