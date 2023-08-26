extends Control


onready var label = get_node("FinalScores")

func _ready() -> void:
	label.text = label.text % [PlayerDataSingleton.playerScore, PlayerDataSingleton.playerDeaths]

