extends Area2D

onready var animationPlayerNode: AnimationPlayer = get_node("AnimationPlayer")

# TODO: Add Gem Feedback on Pick


func _ready() -> void:
	pass  # Replace with function body.



func PickedUp() -> void:
	animationPlayerNode.play("fadeOnPickUp")

func _on_Gem_body_entered(body: Node) -> void:
	PickedUp()

