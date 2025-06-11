extends Area2D

func onBodyEntered(body):
	if body.name == "player":
		var anim = body.get_node("AnimatedSprite2D") as AnimatedSprite2D
		anim.play("green")
	queue_free()
