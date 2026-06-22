extends Node
class_name SaveSystem

const SAVE_VERSION := 1
const DEFAULT_SAVE_PATH := "user://nexus_earth_save.json"

var current_save: Dictionary = create_empty_save()


func create_empty_save() -> Dictionary:
	return {
		"version": SAVE_VERSION,
		"player": {
			"position": {"x": 0.0, "y": 0.0, "z": 0.0},
			"scene": "res://scenes/demo/first_playable_demo.tscn"
		},
		"inventory": [],
		"quests": {
			"active": {},
			"completed": {},
			"failed": {}
		},
		"reputation": {}
	}


func save_game(player: Node = null, path: String = DEFAULT_SAVE_PATH) -> bool:
	if player != null:
		current_save["player"]["position"] = _vector3_to_dict(player.global_position)

		if player.get_tree().current_scene:
			current_save["player"]["scene"] = player.get_tree().current_scene.scene_file_path

	_sync_from_autoloads()

	var file := FileAccess.open(path, FileAccess.WRITE)

	if file == null:
		push_warning("Unable to open save path for writing: %s" % path)
		return false

	file.store_string(JSON.stringify(current_save, "\t"))
	return true


func load_game(path: String = DEFAULT_SAVE_PATH) -> Dictionary:
	if not FileAccess.file_exists(path):
		current_save = create_empty_save()
		_apply_save_to_autoloads()
		return current_save


	var file := FileAccess.open(path, FileAccess.READ)

	var parsed = JSON.parse_string(file.get_as_text())

	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Save file was invalid; using empty save.")
		current_save = create_empty_save()
		_apply_save_to_autoloads()
		return current_save


	current_save = parsed
	_apply_save_to_autoloads()

	return current_save


func _sync_from_autoloads() -> void:
	if has_node("/root/InventoryManager"):
		current_save["inventory"] = InventoryManager.get_save_data()

	if has_node("/root/QuestManager"):
		current_save["quests"] = QuestManager.get_save_data()

	if has_node("/root/ReputationManager"):
		current_save["reputation"] = ReputationManager.get_save_data()



func _apply_save_to_autoloads() -> void:
	if has_node("/root/InventoryManager"):
		InventoryManager.load_save_data(current_save.get("inventory", []))

	if has_node("/root/QuestManager"):
		QuestManager.load_save_data(current_save.get("quests", {}))

	if has_node("/root/ReputationManager"):
		ReputationManager.load_save_data(current_save.get("reputation", {}))



func _vector3_to_dict(value: Vector3) -> Dictionary:
	return {
		"x": value.x,
		"y": value.y,
		"z": value.z
	}