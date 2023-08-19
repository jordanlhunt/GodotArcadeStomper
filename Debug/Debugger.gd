extends Control

onready var player: KinematicBody2D = $"../../Player"
onready var velocity_x: Label = $MarginContainer/VBoxContainer/VelocityX
onready var velocity_y: Label = $MarginContainer/VBoxContainer/VelocityY
onready var position_x: Label = $MarginContainer/VBoxContainer/PositionX
onready var position_y: Label = $MarginContainer/VBoxContainer/PositionY
onready var current_state: Label = $MarginContainer/VBoxContainer/CurrentState
onready var current_animation: Label = $MarginContainer/VBoxContainer/CurrentAnimation
onready var current_direction: Label = $MarginContainer/VBoxContainer/CurrentDirection


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	UpdateDebuggerLabels()


func UpdateDebuggerLabels():
	velocity_x.text = str("Velocity X: ", stepify(player._velocity.x, 0.01))
	velocity_y.text = str("Velocity Y: ", stepify(player._velocity.y, 0.01))
	position_x.text = str("Position X: ", stepify(player.position.x, 0.01))
	position_y.text = str("Position Y: ", stepify(player.position.y, 0.01))
	current_direction.text = str("Flip_h: ", player.animated_sprite.flip_h)
