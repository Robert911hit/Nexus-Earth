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
			"scene": "res://scenes/main.tscn"
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
		current_save["player"]["scene"] = player.get_tree().current_scene.scene_file_path if player.get_tree().current_scene else ""

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
		return current_save

	current_save = _migrate_save(parsed)
	_apply_save_to_autoloads()
	return current_save

func set_inventory(inventory_items: Array) -> void:
	current_save["inventory"] = inventory_items.duplicate(true)

func set_quest_progress(active: Dictionary, completed: Dictionary, failed: Dictionary) -> void:
	current_save["quests"] = {
		"active": active.duplicate(true),
		"completed": completed.duplicate(true),
		"failed": failed.duplicate(true)
	}

func set_reputation(reputation: Dictionary) -> void:
	current_save["reputation"] = reputation.duplicate(true)

func apply_to_player(player: Node) -> void:
	var position_data: Dictionary = current_save.get("player", {}).get("position", {})
	if position_data.is_empty():
		return
	player.global_position = _dict_to_vector3(position_data)

func _migrate_save(save_data: Dictionary) -> Dictionary:
	var migrated := create_empty_save()
	migrated.merge(save_data, true)
	migrated["version"] = SAVE_VERSION
	return migrated

func _vector3_to_dict(value: Vector3) -> Dictionary:
	return {"x": value.x, "y": value.y, "z": value.z}

func _dict_to_vector3(value: Dictionary) -> Vector3:
	return Vector3(value.get("x", 0.0), value.get("y", 0.0), value.get("z", 0.0))


func sync_from_autoloads() -> void:
	var inventory_manager := get_node_or_null("/root/InventoryManager")
	if inventory_manager != null:
		set_inventory(inventory_manager.serialize_inventory())

	var quest_manager := get_node_or_null("/root/QuestManager")
	if quest_manager != null:
		var progress: Dictionary = quest_manager.serialize_progress()
		set_quest_progress(progress.get("active", {}), progress.get("completed", {}), progress.get("failed", {}))

	var reputation_manager := get_node_or_null("/root/ReputationManager")
	if reputation_manager != null:
		set_reputation(reputation_manager.serialize_reputation())

func _apply_save_to_autoloads() -> void:
	var inventory_manager := get_node_or_null("/root/InventoryManager")
	if inventory_manager != null:
		inventory_manager.load_inventory(current_save.get("inventory", []))

	var quest_manager := get_node_or_null("/root/QuestManager")
	if quest_manager != null:
		quest_manager.load_progress(current_save.get("quests", {}))

	var reputation_manager := get_node_or_null("/root/ReputationManager")
	if reputation_manager != null:
		reputation_manager.load_reputation(current_save.get("reputation", {}))
