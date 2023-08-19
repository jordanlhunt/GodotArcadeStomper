extends "res://Src/Actors/Actor.gd"
onready var animated_sprite: Sprite = $AnimatedSprite
onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
const SNAP_PIXELS = 65.0 * Vector2.DOWN
const SPEED = 65
class_name Enemy


func _ready() -> void:
	_velocity.x = -SPEED


func _physics_process(delta: float) -> void:
	var snapVector := SNAP_PIXELS
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide_with_snap(_velocity, snapVector, FLOOR_NORMAL).y
	UpdateAnimatedSprite()


func UpdateAnimatedSprite() -> void:
	if _velocity.x > 1:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false


func Die() -> void:
	queue_free()


func Kill() -> void:
	print("Killed the player")
