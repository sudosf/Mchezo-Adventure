extends Node2D

onready var map = preload("res://dev/scenes/Minimap.tscn")
onready var statsbar = preload("res://dev/scenes/comp/Statsbar.tscn")

var map_instance
var bar_instance

func _ready():
	set_minimap()
	set_statsbar()

func _process(delta):
	var screen_size = get_viewport().get_visible_rect().size
	print(screen_size - Vector2(180, 120))
	map_instance.rect_position = screen_size / 6
	
func set_minimap():
	map_instance = map.instance()
	map_instance.rect_position = Vector2(180, 120)
	$Room/Player/Camera2D.add_child(map_instance)
	$Room/Player.raise()

func set_statsbar():
	bar_instance = statsbar.instance()
	bar_instance.rect_position = Vector2(-510, -330)
	$Room/Player/Camera2D.add_child(bar_instance)
	bar_instance.raise()
