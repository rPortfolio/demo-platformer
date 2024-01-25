extends Node2D

@export_file("*tscn") var next_level: String


func _on_goal_body_entered(body: Node2D) -> void:
	if next_level:
		get_tree().change_scene_to_file(next_level)


func _on_dealth_plane_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(scene_file_path)


func _on_character_body_2d_player_crushed() -> void:
	get_tree().change_scene_to_file(scene_file_path)
