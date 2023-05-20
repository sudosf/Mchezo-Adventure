extends RigidBody2D

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		print("buddy found us")
		$description.visible = true


func _on_Area2D_body_exited(body):
	if body.get_name() == "Player":
		print("buddy left")
		$description.visible = false
