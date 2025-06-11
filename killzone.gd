extends Area2D

@onready var timer = $Timer

func onBodyEntered(body):
	print("Killzone entered by: ", body.name)
	print("You died!")
	timer.start()


func onTimerTimeout() -> void:
	get_tree().reload_current_scene()
