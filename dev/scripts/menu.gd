extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://dev/scenes/choose_country.tscn")


func _on_OptionsButton_pressed():
	var option = load("res://dev/scenes/settings.tscn").instance()
	get_tree().current_scene.add_child(option)
	pass
	


func _on_QuitButton_pressed():
	get_tree().quit()
