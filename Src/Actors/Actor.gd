extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL := Vector2.UP
export var GRAVITY := 2500.0
export var speedLimit := Vector2(300.0, 650.0)
var _velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	_velocity.y += GRAVITY * delta
