extends Node2D

# onready var house = preload("res://dev/scenes/comp/house.tscn")

var player_entered

var house_positions = [
	Vector2(1000, 244),
	Vector2(422, 1000),
	Vector2(1000, 1000),
]

func _ready():
	Global.arrow_follow = $lamp.position

func _process(delta):
	# collect power-ups
	if Input.is_action_pressed("ui_accept") and player_entered:
		Global.updateLbl = "Status: landmark found!"
		Global.score += 5
		player_entered = false
		$q1_landmark.disconnect("body_entered", self, "_on_q1_landmark_body_entered")

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
