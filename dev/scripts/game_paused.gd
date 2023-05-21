extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ResumeGame.grab_focus()
	pass


func _on_Settings_pressed():
	get_tree().change_scene("res://dev/scenes/option.tscn")

func _on_ResumeGame_pressed():
	self.visible = false
	Global.is_paused = false
	# get_tree().change_scene("res://dev/scenes/main_room.tscn")	

func _on_Menu_pressed():
	Global.reset_progress()
	Global.is_paused = false
	get_tree().change_scene("res://dev/scenes/menu.tscn")
