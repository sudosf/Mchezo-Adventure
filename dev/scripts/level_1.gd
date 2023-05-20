extends Node2D

# onready var house = preload("res://dev/scenes/comp/house.tscn")

var house_positions = [
	Vector2(1000, 244),
	Vector2(422, 1000),
	Vector2(1000, 1000),
]

var house_pos = Vector2(422, 244)

func _ready():
	# set_house()
	# set_lamp()
	Global.arrow_follow = $lamp.position
	# print(Global.arrow_follow)

"""
func set_q1_landmark():
	for pos in house_positions:
		var house_int = house.instance()
		house_int.get_node("description").text = "We just made house"
		house_int.position = pos
		add_child(house_int) 

func set_lamp():
	var lamp_int = lamp.instance()
	lamp_int.get_node("description").text = "get your question here"
	lamp_int.position = house_pos
	add_child(lamp_int)
"""
