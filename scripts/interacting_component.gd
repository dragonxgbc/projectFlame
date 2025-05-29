extends Node2D

@onready var interactLabel: Label = $InteractLabel
var currentInteractions := []
var canInteract := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and canInteract:
		if currentInteractions:
			canInteract	= false
			interactLabel.hide()

			await currentInteractions[0].interact.call()

			canInteract = true


func _process (delta: float) -> void:
	if currentInteractions and canInteract:
		currentInteractions.sort_custom(_sortByNearest)
		if currentInteractions[0].isInteractable:
			interactLabel.text = currentInteractions[0].interactName
			interactLabel.show()
		else:
			interactLabel.hide()

func _sortByNearest(area1, area2):
	var area1Distance = global_position.distance_to(area1.global_position)
	var area2Distance = global_position.distance_to(area2.global_position)
	return area1Distance < area2Distance



func _on_interact_range_area_entered(area: Area2D) -> void:
	currentInteractions.push_back(area)

func _on_interact_range_area_exited(area: Area2D) -> void:
	currentInteractions.erase(area)
