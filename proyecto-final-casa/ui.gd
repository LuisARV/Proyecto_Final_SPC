extends Control

@onready var trashText = $Label

func update_trash_text(gold):
	trashText.text = "Basura: " +str(gold) + " / 17"
