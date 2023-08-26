extends Control

onready var sceneTree = get_tree()
onready var pauseOverlayNode: ColorRect = get_node("PauseOverlay")
onready var scoreLabelNode = get_node("Score")
onready var titleLabelNode = get_node("PauseOverlay/TitleLabel")
var isPaused = false setget SetPaused

func _ready() -> void:
	PlayerDataSingleton.connect("SCORE_UPDATED", self, "UpdateInterface")
	PlayerDataSingleton.connect("PLAYER_HAS_DIED", self, "OnPlayerHasDied")
	UpdateInterface()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pausegame"):
		self.isPaused =  !isPaused
		sceneTree.set_input_as_handled()

func SetPaused(value: bool) -> void:
	isPaused = value
	sceneTree.paused = value
	pauseOverlayNode.visible = value

func UpdateInterface() -> void:
	scoreLabelNode.text = "Score: %s" % PlayerDataSingleton.playerScore

func OnPlayerHasDied() -> void:
	self.isPaused = true
	titleLabelNode.text = "Stomper will be forgotten by time"
