extends Node2D

onready var map = preload("res://dev/scenes/Minimap.tscn")
onready var statsbar = preload("res://dev/scenes/comp/Statsbar.tscn")

func _ready():
	set_minimap()
	# set_statsbar()

func set_minimap():
	var map_instance = map.instance()
	map_instance.rect_position = Vector2(180, 120)
	$Room/Player/Camera2D.add_child(map_instance)
	$Room/Player.raise()

func set_statsbar():
	var bar_instance = statsbar.instance()
	bar_instance.rect_position = Vector2(-300, 200)
	$Room/Player/Camera2D.add_child(bar_instance)
	bar_instance.raise()
