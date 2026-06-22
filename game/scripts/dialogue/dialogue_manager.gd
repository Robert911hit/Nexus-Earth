extends Node
class_name DialogueManager

signal dialogue_started(dialogue_id: String)
signal dialogue_advanced(dialogue_id: String, node_id: String)
signal dialogue_choice_selected(dialogue_id: String, choice_id: String)
signal dialogue_finished(dialogue_id: String)

var dialogue_database: Dictionary = {}
var active_dialogue_id: String = ""
var active_node_id: String = ""

func load_dialogue_file(path: String) -> bool:
	if not FileAccess.file_exists(path):
		push_warning("Dialogue file not found: %s" % path)
		return false

	var file := FileAccess.open(path, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Dialogue file must contain a JSON object: %s" % path)
		return false

	dialogue_database[parsed.get("id", path)] = parsed
	return true

func start_dialogue(dialogue_id: String, start_node: String = "start") -> Dictionary:
	if not dialogue_database.has(dialogue_id):
		push_warning("Unknown dialogue id: %s" % dialogue_id)
		return {}

	active_dialogue_id = dialogue_id
	active_node_id = start_node
	dialogue_started.emit(dialogue_id)
	return get_active_node()

func get_active_node() -> Dictionary:
	if active_dialogue_id.is_empty():
		return {}

	var dialogue: Dictionary = dialogue_database.get(active_dialogue_id, {})
	var nodes: Dictionary = dialogue.get("nodes", {})
	return nodes.get(active_node_id, {})

func choose(choice_id: String) -> Dictionary:
	var node := get_active_node()
	for choice in node.get("choices", []):
		if choice.get("id", "") == choice_id:
			dialogue_choice_selected.emit(active_dialogue_id, choice_id)
			_apply_choice_events(choice)
			active_node_id = choice.get("next", "")
			if active_node_id.is_empty() or active_node_id == "end":
				var completed_id := active_dialogue_id
				active_dialogue_id = ""
				active_node_id = ""
				dialogue_finished.emit(completed_id)
				return {}
			dialogue_advanced.emit(active_dialogue_id, active_node_id)
			return get_active_node()

	push_warning("Choice not found: %s" % choice_id)
	return node

func _apply_choice_events(choice: Dictionary) -> void:
	for event in choice.get("events", []):
		if event.get("type", "") == "quest_signal":
			var quest_manager := get_node_or_null("/root/QuestManager")
			if quest_manager != null:
				quest_manager.apply_dialogue_event(event)
