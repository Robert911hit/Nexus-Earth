extends Area3D
class_name NPCBase

signal interaction_available(npc: NPCBase, is_available: bool)
signal interacted(npc: NPCBase)

@export var npc_id: String = "npc"
@export var display_name: String = "NPC"
@export var dialogue_id: String = ""
@export var schedule_id: String = "default"
@export var interaction_prompt: String = "Press E to talk"

var nearby_player: Node = null
var schedule_state: Dictionary = {
	"enabled": false,
	"current_block": "prototype",
	"future_schedule_source": "data/npc_schedules"
}

func _ready() -> void:
	monitoring = true
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _unhandled_input(event: InputEvent) -> void:
	if nearby_player != null and event.is_action_pressed("interact"):
		interact(nearby_player)

func interact(player: Node) -> void:
	interacted.emit(self)
	if not dialogue_id.is_empty():
		var dialogue_manager := get_node_or_null("/root/DialogueManager")
		if dialogue_manager != null:
			if not dialogue_manager.dialogue_database.has(dialogue_id):
				dialogue_manager.load_dialogue_file("res://data/dialogue/fringe_intro_dialogue.json")
			dialogue_manager.start_dialogue(dialogue_id)

func get_display_name() -> String:
	return display_name

func get_schedule_snapshot() -> Dictionary:
	return schedule_state.duplicate(true)

func set_schedule_block(block_id: String) -> void:
	schedule_state["current_block"] = block_id

func _on_body_entered(body: Node) -> void:
	if body is PlayerController:
		nearby_player = body
		interaction_available.emit(self, true)

func _on_body_exited(body: Node) -> void:
	if body == nearby_player:
		nearby_player = null
		interaction_available.emit(self, false)
