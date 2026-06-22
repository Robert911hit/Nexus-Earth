extends Control
class_name QuestUI

@onready var active_quests_list: VBoxContainer = $Panel/MarginContainer/VBoxContainer/ActiveQuests
@onready var completion_popup: AcceptDialog = $QuestCompletionPopup

func _ready() -> void:
	QuestManager.quest_accepted.connect(_on_quest_changed)
	QuestManager.quest_completed.connect(_on_quest_completed)
	QuestManager.quest_failed.connect(_on_quest_failed)
	QuestManager.quest_rewarded.connect(_on_quest_rewarded)
	refresh()

func refresh() -> void:
	for child in active_quests_list.get_children():
		child.queue_free()

	if QuestManager.active_quests.is_empty():
		var empty_label := Label.new()
		empty_label.text = "No active quests"
		active_quests_list.add_child(empty_label)
		return

	for quest_id in QuestManager.active_quests.keys():
		active_quests_list.add_child(_build_quest_block(quest_id, QuestManager.active_quests[quest_id]))

func _build_quest_block(quest_id: String, quest_state: Dictionary) -> VBoxContainer:
	var block := VBoxContainer.new()
	var title := Label.new()
	var definition: Dictionary = QuestManager.quest_definitions.get(quest_id, {})
	title.text = "%s - %s" % [quest_id, definition.get("name", "Untitled Quest")]
	block.add_child(title)

	var objectives: Dictionary = quest_state.get("objectives", {})
	for objective_id in objectives.keys():
		var objective: Dictionary = objectives[objective_id]
		var objective_label := Label.new()
		var marker := "✓" if objective.get("complete", false) else "•"
		objective_label.text = "%s %s (%s/%s)" % [marker, objective.get("description", objective_id), objective.get("progress", 0), objective.get("required", 1)]
		block.add_child(objective_label)

	return block

func _on_quest_changed(_quest_id: String) -> void:
	refresh()

func _on_quest_completed(quest_id: String, rewards: Dictionary) -> void:
	completion_popup.title = "Quest Complete"
	completion_popup.dialog_text = "%s complete. Rewards: %s" % [quest_id, JSON.stringify(rewards)]
	completion_popup.popup_centered()
	refresh()

func _on_quest_failed(_quest_id: String, _reason: String) -> void:
	refresh()

func _on_quest_rewarded(_quest_id: String, _rewards: Dictionary) -> void:
	refresh()
