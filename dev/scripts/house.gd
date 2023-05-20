extends RigidBody2D


func _ready():
	pass

func _on_Area2D_body_entered(body):
	print(body.get_name())
