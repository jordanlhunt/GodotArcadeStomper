extends Node

signal SCORE_UPDATED
signal PLAYER_HAS_DIED

var playerScore := 0 setget SetPlayerScore
var playerDeaths := 0 setget SetPlayerDeaths


func Reset() -> void:
	playerDeaths = 0
	playerScore = 0


func SetPlayerScore(newScore: int) -> void:
	playerScore = newScore
	emit_signal("SCORE_UPDATED")


func SetPlayerDeaths(newDeath: int) -> void:
	playerDeaths = newDeath
	emit_signal("PLAYER_HAS_DIED")
