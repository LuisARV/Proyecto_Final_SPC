extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Asegura que el cursor sea visible

func _on_button_pressed() -> void:
	get_tree().quit()
