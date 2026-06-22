extends Node3D
class_name DemoController

@onready var dialogue_ui: DialogueUI = $CanvasLayer/DialoguePanel
@onready var quest_ui: QuestUI = $CanvasLayer/QuestPanel
@onready var prompt_label: Label = $CanvasLayer/InteractionPrompt
@onready var status_label: Label = $CanvasLayer/StatusLabel
@onready var scrap_crate: ScrapCrate = $ScrapCrate

func _ready() -> void:
	DialogueManager.load_dialogue_file("res://data/dialogue/fringe_intro_dialogue.json")
	QuestManager.load_quest_file("res://data/quests/beginner_quests.json")
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_advanced.connect(_on_dialogue_advanced)
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	QuestManager.quest_completed.connect(_on_quest_completed)
	QuestManager.quest_rewarded.connect(_on_quest_rewarded)

	var cael: NPCBase = $CaelNPC
	cael.interaction_available.connect(_on_npc_interaction_available)
	cael.interacted.connect(_on_npc_interacted)
	scrap_crate.interaction_available.connect(_on_crate_interaction_available)
	scrap_crate.interacted.connect(_on_crate_interacted)
	SaveSystem.load_game()
	if SaveSystem.current_save.has("world"):
		scrap_crate.load_state(SaveSystem.current_save.get("world", {}).get("scrap_crate", {}))
	InventoryManager.add_item("ITM-100", 1, 1, {"name": "First Shelter Access Card"})
	if ReputationManager.get_reputation(ReputationManager.FRINGE) < 5:
		ReputationManager.set_reputation(ReputationManager.FRINGE, 5)
	prompt_label.visible = false
	status_label.visible = false
	dialogue_ui.visible = false
	quest_ui.refresh()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("demo_complete_quest"):
		_complete_beg_001_demo()
	elif event.is_action_pressed("save_game"):
		SaveSystem.current_save["world"] = {"scrap_crate": scrap_crate.serialize_state()}
		SaveSystem.sync_from_autoloads()
		SaveSystem.save_game($Player)

func _on_dialogue_started(_dialogue_id: String) -> void:
	dialogue_ui.show_node(DialogueManager.get_active_node())

func _on_dialogue_advanced(_dialogue_id: String, _node_id: String) -> void:
	dialogue_ui.show_node(DialogueManager.get_active_node())

func _on_dialogue_finished(_dialogue_id: String) -> void:
	dialogue_ui.show_node({})
	if QuestManager.active_quests.has("BEG-001"):
		QuestManager.update_objective("BEG-001", "talk_to_cael")
	quest_ui.refresh()

func _on_npc_interaction_available(npc: NPCBase, is_available: bool) -> void:
	prompt_label.visible = is_available
	prompt_label.text = "%s: %s" % [npc.get_display_name(), npc.interaction_prompt]

func _on_npc_interacted(_npc: NPCBase) -> void:
	prompt_label.visible = false
	_try_complete_beg_001()

func _complete_beg_001_demo() -> void:
	if not QuestManager.active_quests.has("BEG-001"):
		QuestManager.accept_quest("BEG-001")
	QuestManager.update_objective("BEG-001", "talk_to_cael")
	QuestManager.update_objective("BEG-001", "search_scrap_crate")
	_try_complete_beg_001()

func _on_crate_interaction_available(crate: ScrapCrate, is_available: bool) -> void:
	prompt_label.visible = is_available
	prompt_label.text = "%s: %s" % [crate.get_display_name(), crate.interaction_prompt]

func _on_crate_interacted(crate: ScrapCrate) -> void:
	prompt_label.visible = false
	status_label.visible = true
	status_label.text = "%s searched. Return to Cael." % crate.get_display_name()
	SaveSystem.current_save["world"] = {"scrap_crate": scrap_crate.serialize_state()}
	SaveSystem.sync_from_autoloads()
	quest_ui.refresh()

func _try_complete_beg_001() -> void:
	if not QuestManager.active_quests.has("BEG-001"):
		return
	var objectives: Dictionary = QuestManager.active_quests["BEG-001"].get("objectives", {})
	if objectives.get("talk_to_cael", {}).get("complete", false) and objectives.get("search_scrap_crate", {}).get("complete", false):
		QuestManager.update_objective("BEG-001", "return_to_cael")
		QuestManager.complete_quest("BEG-001")

func _on_quest_completed(_quest_id: String, _rewards: Dictionary) -> void:
	SaveSystem.current_save["world"] = {"scrap_crate": scrap_crate.serialize_state()}
	SaveSystem.sync_from_autoloads()

func _on_quest_rewarded(quest_id: String, rewards: Dictionary) -> void:
	if quest_id != "BEG-001":
		return
	InventoryManager.add_item("currency", rewards.get("currency", 0), 999999, {"name": "Credits"})
	ReputationManager.add_reputation(ReputationManager.FRINGE, rewards.get("reputation", {}).get(ReputationManager.FRINGE, 0))
	SaveSystem.current_save["world"] = {"scrap_crate": scrap_crate.serialize_state()}
	SaveSystem.save_game($Player)
