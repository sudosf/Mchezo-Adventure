extends Sprite

func _ready():
	pass

func _process(delta):
	if Global.arrow_active:
		self.visible = true
	else: self.visible = false
	
	look_at(Global.arrow_follow)
