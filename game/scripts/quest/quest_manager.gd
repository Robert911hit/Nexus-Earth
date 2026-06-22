extends Node
class_name QuestManager

signal quest_accepted(quest_id: String)
signal quest_completed(quest_id: String, rewards: Dictionary)
signal quest_failed(quest_id: String, reason: String)
signal quest_rewarded(quest_id: String, rewards: Dictionary)

var quest_definitions: Dictionary = {}
var active_quests: Dictionary = {}
var completed_quests: Dictionary = {}
var failed_quests: Dictionary = {}

func load_quest_file(path: String) -> bool:
	if not FileAccess.file_exists(path):
		push_warning("Quest file not found: %s" % path)
		return false

	var file := FileAccess.open(path, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Quest file must contain a JSON object: %s" % path)
		return false

	for quest in parsed.get("quests", []):
		quest_definitions[quest.get("id", "")] = quest
	return true

func accept_quest(quest_id: String) -> bool:
	if not quest_definitions.has(quest_id) or active_quests.has(quest_id) or completed_quests.has(quest_id):
		return false

	active_quests[quest_id] = {
		"id": quest_id,
		"state": "active",
		"objectives": _build_objective_state(quest_definitions[quest_id].get("objectives", []))
	}
	quest_accepted.emit(quest_id)
	return true

func complete_quest(quest_id: String) -> bool:
	if not active_quests.has(quest_id):
		return false

	var rewards: Dictionary = quest_definitions.get(quest_id, {}).get("rewards", {})
	completed_quests[quest_id] = active_quests[quest_id]
	completed_quests[quest_id]["state"] = "completed"
	active_quests.erase(quest_id)
	quest_completed.emit(quest_id, rewards)
	reward_quest(quest_id)
	return true

func fail_quest(quest_id: String, reason: String = "") -> bool:
	if not active_quests.has(quest_id):
		return false

	failed_quests[quest_id] = active_quests[quest_id]
	failed_quests[quest_id]["state"] = "failed"
	failed_quests[quest_id]["failure_reason"] = reason
	active_quests.erase(quest_id)
	quest_failed.emit(quest_id, reason)
	return true

func reward_quest(quest_id: String) -> Dictionary:
	var rewards: Dictionary = quest_definitions.get(quest_id, {}).get("rewards", {})
	quest_rewarded.emit(quest_id, rewards)
	return rewards

func update_objective(quest_id: String, objective_id: String, amount: int = 1) -> bool:
	if not active_quests.has(quest_id):
		return false

	var objectives: Dictionary = active_quests[quest_id].get("objectives", {})
	if not objectives.has(objective_id):
		return false

	objectives[objective_id]["progress"] = min(objectives[objective_id]["required"], objectives[objective_id]["progress"] + amount)
	objectives[objective_id]["complete"] = objectives[objective_id]["progress"] >= objectives[objective_id]["required"]
	return true

func apply_dialogue_event(event: Dictionary) -> void:
	var action := event.get("action", "")
	var quest_id := event.get("quest_id", "")
	if action == "accept":
		accept_quest(quest_id)
	elif action == "complete":
		complete_quest(quest_id)
	elif action == "fail":
		fail_quest(quest_id, event.get("reason", "dialogue"))
	elif action == "objective":
		update_objective(quest_id, event.get("objective_id", ""), event.get("amount", 1))

func serialize_progress() -> Dictionary:
	return {
		"active": active_quests.duplicate(true),
		"completed": completed_quests.duplicate(true),
		"failed": failed_quests.duplicate(true)
	}

func load_progress(progress: Dictionary) -> void:
	active_quests = progress.get("active", {}).duplicate(true)
	completed_quests = progress.get("completed", {}).duplicate(true)
	failed_quests = progress.get("failed", {}).duplicate(true)

func _build_objective_state(objectives: Array) -> Dictionary:
	var state := {}
	for objective in objectives:
		var objective_id: String = objective.get("id", "")
		state[objective_id] = {
			"description": objective.get("description", ""),
			"progress": 0,
			"required": objective.get("required", 1),
			"complete": false
		}
	return state
