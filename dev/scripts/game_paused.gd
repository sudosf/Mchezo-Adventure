extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ResumeGame.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_pressed():
	get_tree().change_scene("res://dev/scene/menu.tscn")


func _on_Settings_pressed():
	var option = load("res://dev/scenes/settings.tscn").instance()
	get_tree().current_scene.add_child(option)
