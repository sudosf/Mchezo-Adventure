extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/BackButton.grab_focus()

func _on_BackButton_pressed():
	get_tree().change_scene("res://dev/scenes/menu.tscn")
