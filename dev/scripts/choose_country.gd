extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Johannesburg.grab_focus()


func _on_BackButton_pressed():
	get_tree().change_scene("res://dev/scenes/menu.tscn")


func _on_Johannesburg_pressed():
	get_tree().change_scene("res://dev/scenes/test_room.tscn")
