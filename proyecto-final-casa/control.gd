extends Control

func _on_salir_pressed() -> void:
	get_tree().quit()

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenaCarretera.tscn")
