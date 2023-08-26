extends Area2D

onready var animationPlayerNode: AnimationPlayer = get_node("AnimationPlayer")
const SCORE_VALUE = 10


func _ready() -> void:
	pass  # Replace with function body.


func PickedUp() -> void:
	PlayerDataSingleton.playerScore += SCORE_VALUE
	animationPlayerNode.play("fadeOnPickUp")


func _on_Gem_body_entered(body: Node) -> void:
	PickedUp()
