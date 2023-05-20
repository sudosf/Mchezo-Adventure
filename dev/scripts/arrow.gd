extends Sprite


func _ready():
	pass

func _process(delta):
	look_at(Global.arrow_follow)
