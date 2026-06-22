extends Area3D
class_name ScrapCrate

signal interaction_available(crate: ScrapCrate, is_available: bool)
signal interacted(crate: ScrapCrate)

@export var display_name: String = "Scrap Crate"
@export var interaction_prompt: String = "Press E to search"
@export var quest_id: String = "BEG-001"
@export var objective_id: String = "search_scrap_crate"

var nearby_player: Node = null
var searched := false

func _ready() -> void:
	monitoring = true
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _unhandled_input(event: InputEvent) -> void:
	if nearby_player != null and event.is_action_pressed("interact"):
		interact()

func interact() -> void:
	if searched:
		return

	if not has_node("/root/QuestManager") or not QuestManager.update_objective(quest_id, objective_id):
		return

	searched = true
	interacted.emit(self)
	interaction_available.emit(self, false)

func get_display_name() -> String:
	return display_name

func serialize_state() -> Dictionary:
	return {"searched": searched}

func load_state(state: Dictionary) -> void:
	searched = state.get("searched", false)

func _on_body_entered(body: Node) -> void:
	if body is PlayerController and not searched:
		nearby_player = body
		interaction_available.emit(self, true)

func _on_body_exited(body: Node) -> void:
	if body == nearby_player:
		nearby_player = null
		interaction_available.emit(self, false)
