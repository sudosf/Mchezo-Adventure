extends Control


func _ready():
	$Panel/Control.visible = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()


func toggle_pause():
	if Global.is_paused:
		$Panel/Control.visible = false
		Global.is_paused = false
		$"/root/BackgroundMusic".stop()
		
	else: 
		$"/root/BackgroundMusic".play()
		$Panel/Control.visible = true
		Global.is_paused = true
		


func _on_pauseBtn_pressed():
	toggle_pause()
