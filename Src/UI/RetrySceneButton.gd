extends Button





func _on_RetrySceneButton_button_up() -> void:
	PlayerDataSingleton.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()

