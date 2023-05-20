extends Control


func _ready():
	pass


func _on_playBtn_pressed():
	get_tree().change_scene("res://dev/scenes/main_room.tscn")


func _on_settingsBtn_pressed():
	pass # Replace with function body.


func _on_exitBtn_pressed():
	get_tree().quit()
