tool
extends Area2D

export var nextLevel: PackedScene
onready var animationPlayerNode: AnimationPlayer = $AnimationPlayer


func _get_configuration_warning() -> String:
	var errorMessage: String
	if not nextLevel:
		errorMessage = "The next scene property can't be empty. Load a scene for the portal's nextLevel variable."
	else:
		errorMessage = ""
	return errorMessage


func TeleportToNextLevel() -> void:
	animationPlayerNode.play("FadeIn")
	yield(animationPlayerNode, "animation_finished")
	get_tree().change_scene_to(nextLevel)


func _on_Portal_body_entered(body: Node) -> void:
	print(body.name)
	TeleportToNextLevel()
