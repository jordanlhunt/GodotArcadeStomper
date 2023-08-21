tool
extends Button

export(String, FILE) var nextScenePath = ""


func _on_PlayButton_button_up() -> void:
	get_tree().change_scene(nextScenePath)

func _get_configuration_warning() -> String:
	var warning: String
	if nextScenePath == "":
		warning	= "Next Scene Path must have a String value for button to function"
	else:
		warning = ""
	return warning
