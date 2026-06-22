extends Node
class_name ReputationManager

signal reputation_changed(track_id: String, value: int)

const FRINGE := "fringe"
const GRAY_LINE := "gray_line"
const SOLENNE := "solenne"
const MIN_REPUTATION := -100
const MAX_REPUTATION := 100

var reputation: Dictionary = {
	FRINGE: 0,
	GRAY_LINE: 0,
	SOLENNE: 0
}

func add_reputation(track_id: String, amount: int) -> int:
	return set_reputation(track_id, get_reputation(track_id) + amount)

func set_reputation(track_id: String, value: int) -> int:
	if not reputation.has(track_id):
		reputation[track_id] = 0

	reputation[track_id] = clamp(value, MIN_REPUTATION, MAX_REPUTATION)
	reputation_changed.emit(track_id, reputation[track_id])
	return reputation[track_id]

func get_reputation(track_id: String) -> int:
	return reputation.get(track_id, 0)

func get_reputation_label(track_id: String) -> String:
	var value := get_reputation(track_id)
	if value >= 60:
		return "Trusted"
	if value >= 20:
		return "Known"
	if value <= -60:
		return "Hostile"
	if value <= -20:
		return "Distrusted"
	return "Neutral"

func serialize_reputation() -> Dictionary:
	return reputation.duplicate(true)

func load_reputation(saved_reputation: Dictionary) -> void:
	for track_id in [FRINGE, GRAY_LINE, SOLENNE]:
		set_reputation(track_id, saved_reputation.get(track_id, 0))
