extends Control
class_name DialogueUI

@onready var speaker_label: Label = $SpeakerLabel
@onready var body_label: RichTextLabel = $BodyLabel
@onready var choices_container: VBoxContainer = $Choices

func show_node(node: Dictionary) -> void:
	visible = not node.is_empty()
	if node.is_empty():
		return

	speaker_label.text = node.get("speaker", "")
	body_label.text = node.get("text", "")
	_render_choices(node.get("choices", []))

func _render_choices(choices: Array) -> void:
	for child in choices_container.get_children():
		child.queue_free()

	for choice in choices:
		var button := Button.new()
		button.text = choice.get("text", "Continue")
		button.pressed.connect(_on_choice_pressed.bind(choice.get("id", "")))
		choices_container.add_child(button)

func _on_choice_pressed(choice_id: String) -> void:
	var next_node := DialogueManager.choose(choice_id)
	show_node(next_node)
