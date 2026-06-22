extends Node3D
class_name DemoController

@onready var dialogue_ui: DialogueUI = $CanvasLayer/DialoguePanel
@onready var quest_ui: QuestUI = $CanvasLayer/QuestPanel
@onready var prompt_label: Label = $CanvasLayer/InteractionPrompt

func _ready() -> void:
	DialogueManager.load_dialogue_file("res://data/dialogue/fringe_intro_dialogue.json")
	QuestManager.load_quest_file("res://data/quests/beginner_quests.json")
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_advanced.connect(_on_dialogue_advanced)
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	QuestManager.quest_completed.connect(_on_quest_completed)

	var cael: NPCBase = $CaelNPC
	cael.interaction_available.connect(_on_npc_interaction_available)
	cael.interacted.connect(_on_npc_interacted)
	InventoryManager.add_item("ITM-100", 1, 1, {"name": "First Shelter Access Card"})
	ReputationManager.set_reputation(ReputationManager.FRINGE, 5)
	prompt_label.visible = false
	dialogue_ui.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("demo_complete_quest"):
		_complete_beg_001_demo()
	elif event.is_action_pressed("save_game"):
		SaveSystem.sync_from_autoloads()
		SaveSystem.save_game($Player)

func _on_dialogue_started(_dialogue_id: String) -> void:
	dialogue_ui.show_node(DialogueManager.get_active_node())

func _on_dialogue_advanced(_dialogue_id: String, _node_id: String) -> void:
	dialogue_ui.show_node(DialogueManager.get_active_node())

func _on_dialogue_finished(_dialogue_id: String) -> void:
	dialogue_ui.show_node({})
	quest_ui.refresh()

func _on_npc_interaction_available(npc: NPCBase, is_available: bool) -> void:
	prompt_label.visible = is_available
	prompt_label.text = "%s: %s" % [npc.get_display_name(), npc.interaction_prompt]

func _on_npc_interacted(_npc: NPCBase) -> void:
	prompt_label.visible = false

func _complete_beg_001_demo() -> void:
	if not QuestManager.active_quests.has("BEG-001"):
		QuestManager.accept_quest("BEG-001")
	QuestManager.update_objective("BEG-001", "enter_fringe")
	QuestManager.update_objective("BEG-001", "find_shelter")
	QuestManager.update_objective("BEG-001", "meet_cael")
	QuestManager.complete_quest("BEG-001")
	InventoryManager.add_item("currency", 50, 999999, {"name": "Credits"})
	ReputationManager.add_reputation(ReputationManager.FRINGE, 10)

func _on_quest_completed(_quest_id: String, _rewards: Dictionary) -> void:
	SaveSystem.sync_from_autoloads()
