extends Node

# player stats
var score = 0
var timer_mins = 1
var questions_complete = 0
var power_ups = 0 

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
	{"qn": "find the prominent landmark by exploring the area, Press 'Enter' once you found it"}
]

var hide_qnLbl: bool = false

var curr_question_set: bool = false
var total_questions = 3
var qn_type = "Mission"
var intial_question = "go to the station post to get your first assignment"
var curr_question


func _ready():
	curr_question = intial_question

func update_qnLbl():
	for obj in questions:
		var qn = obj["qn"]
		curr_question = qn
		questions.erase(obj)
		print(questions)
		break
