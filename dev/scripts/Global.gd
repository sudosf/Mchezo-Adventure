extends Node

# player stats
var score = 0
var timer_mins = 5
var questions_complete = 0
var power_ups = 0 

var pos_offset = Vector2(8000, 8000)
# action button
var action_pressed = false

# status lbl
var updateLbl = "Status: Exploring"

var arrow_follow = Vector2(0, 0) # default

var is_paused: bool = false

# enable question station
var lamp_active = true
var arrow_active = true

# list on questions
# order determines how they will be asked
var questions = [
	{"question": "find the prominent landmark by exploring the area, Press 'E' or 'Enter' once you found it", "answer": "none"},
	{"question": "What is the nickname of Johannesburg? explore to find the answer", "answer": "Jozi"},
	{"question": "Which is the most prominent mode of transportation? explore and find the correct vehicle", "answer": "mini-taxi"}
]

var hide_qnLbl: bool = false

var curr_question_set: bool = false
var total_questions = 3
var qn_type = "Mission"

var correct_answer = "none"
var initial_question = "go to the station post to get your next mission"

var curr_question_num = 1
var curr_question

var q2_complete: bool = false
var q2_attempts = 0

var q3_complete: bool = false

var q2_instance : Array

func _ready():
	curr_question = initial_question

func update_qnLbl():
	if q3_complete:
		updateLbl = "Status: demo complete"
		Global.curr_question = "all questions answered"
		Global.arrow_active = false
		Global.lamp_active = false
		
	if !curr_question_set:
		for obj in questions:
			curr_question = obj["question"]
			correct_answer = obj["answer"]
			questions.erase(obj)
			print(correct_answer)
			break

func reset_station():
		# question complete, set next one
		Global.lamp_active = true
		Global.curr_question = Global.initial_question
		Global.curr_question_set = false
		Global.arrow_active = true

func reset_progress():
	score = 0
	timer_mins = 5
	questions_complete = 0
	power_ups = 0 

func set_gameover():
	get_tree().change_scene("res://dev/scenes/end_game.tscn")
