extends Control


func _ready() -> void:
	$Button.grab_focus()


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://map/map_0.tscn")
