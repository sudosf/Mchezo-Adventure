extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Statsbar/Panel/toEndGameBtn.visible = false
	pass 
	
func _on_Playagain_pressed():
	Global.reset_progress()
	get_tree().change_scene("res://dev/scenes/choose_country.tscn")

func _on_quit_pressed():
	get_tree().change_scene("res://dev/scenes/menu.tscn")
