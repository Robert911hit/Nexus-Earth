extends Node
class_name InventoryManager

signal inventory_changed(items: Dictionary)
signal item_added(item_id: String, quantity: int)
signal item_removed(item_id: String, quantity: int)

var items: Dictionary = {}

func add_item(item_id: String, quantity: int = 1, max_stack: int = 99, metadata: Dictionary = {}) -> bool:
	if item_id.is_empty() or quantity <= 0:
		return false

	var existing: Dictionary = items.get(item_id, {"item_id": item_id, "quantity": 0, "max_stack": max_stack, "metadata": metadata.duplicate(true)})
	var new_quantity: int = min(existing.get("quantity", 0) + quantity, existing.get("max_stack", max_stack))
	existing["quantity"] = new_quantity
	existing["max_stack"] = max_stack
	existing["metadata"] = metadata.duplicate(true) if not metadata.is_empty() else existing.get("metadata", {})
	items[item_id] = existing
	item_added.emit(item_id, quantity)
	inventory_changed.emit(items.duplicate(true))
	return true

func remove_item(item_id: String, quantity: int = 1) -> bool:
	if not items.has(item_id) or quantity <= 0:
		return false

	var existing: Dictionary = items[item_id]
	existing["quantity"] = max(existing.get("quantity", 0) - quantity, 0)
	if existing["quantity"] <= 0:
		items.erase(item_id)
	else:
		items[item_id] = existing

	item_removed.emit(item_id, quantity)
	inventory_changed.emit(items.duplicate(true))
	return true

func has_item(item_id: String, quantity: int = 1) -> bool:
	return items.get(item_id, {}).get("quantity", 0) >= quantity

func get_item_count(item_id: String) -> int:
	return items.get(item_id, {}).get("quantity", 0)

func serialize_inventory() -> Array:
	var serialized: Array = []
	for item_id in items.keys():
		serialized.append(items[item_id].duplicate(true))
	return serialized

func load_inventory(serialized_items: Array) -> void:
	items.clear()
	for entry in serialized_items:
		if typeof(entry) == TYPE_DICTIONARY and not entry.get("item_id", "").is_empty():
			items[entry["item_id"]] = entry.duplicate(true)
	inventory_changed.emit(items.duplicate(true))

func clear_inventory() -> void:
	items.clear()
	inventory_changed.emit(items.duplicate(true))
