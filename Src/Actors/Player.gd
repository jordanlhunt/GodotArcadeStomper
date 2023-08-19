extends Actor
onready var animated_sprite: Sprite = $AnimatedSprite
export var stompImpulse = 750.0
var bumperImpulse = 910.0
const SNAP_PIXELS = Vector2.DOWN * 5
var snapVector

# TODO 8/12/2023: Add VFX to player


func _physics_process(delta: float) -> void:
	var isJumpInterrupted = Input.is_action_just_released("jump") and is_on_floor()
	var direction = GetDirection()
	_velocity = CalculateMoveVelocity(_velocity, direction, speedLimit, isJumpInterrupted)
	# Disable snapping if the player wants to jump
	if direction.y == 0.0:
		snapVector = SNAP_PIXELS
	else:
		snapVector = Vector2.ZERO
	_velocity.y = move_and_slide_with_snap(_velocity, snapVector, FLOOR_NORMAL, true, 4, PI / 2.0).y
	Stomp()
	UpdateAnimatedSprite()


func GetDirection() -> Vector2:
	var playerGravity := 0.0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		playerGravity = -1.0
	else:
		playerGravity = 0.0
	return Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		playerGravity
	)


func CalculateMoveVelocity(
	linearVelocity: Vector2, direction: Vector2, speed: Vector2, isJumpInterrupted: bool
) -> Vector2:
	var newVelocity = linearVelocity
	newVelocity.x = speed.x * direction.x
	newVelocity.y += GRAVITY * get_physics_process_delta_time()
	if direction.y != 0.0:
		newVelocity.y = speed.y * direction.y
	if isJumpInterrupted:
		newVelocity.y = 0.0
	return newVelocity


func UpdateAnimatedSprite() -> void:
	if _velocity.x > 0:
		animated_sprite.flip_h = false
	if _velocity.x < 0:
		animated_sprite.flip_h = true


func _on_EnemyDetector_body_entered(body: Node) -> void:
	if body.has_method("Kill"):
		body.Kill()
		queue_free()


func Stomp() -> void:
	for i in get_slide_count():
		var collision := get_slide_collision(i)
		var collider := collision.collider
		var isStomping := (
			collider is Enemy
			and collision.normal.is_equal_approx(Vector2.UP)
			and is_on_floor()
		)
		var isBouncing := (
			collider is Bumper
			and collision.normal.is_equal_approx(Vector2.UP)
			and is_on_floor()
		)
		if isStomping:
			self._velocity.y = -stompImpulse
			(collider as Enemy).Die()
			print("Stomp() worked")
		if isBouncing:
			self._velocity.y = -bumperImpulse
			print("Bounce() worked")
