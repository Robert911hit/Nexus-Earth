# NPC Integration

Date: 2026-06-22
Scope: Existing NPC architecture using `story/npcs/`, `game/scenes/npc/`, and `game/data/dialogue/`.

## NPC ID Format

Current implemented NPC scene data uses lowercase, stable string IDs.

Example:

- Scene: `game/scenes/npc/cael_npc.tscn`
- NPC ID: `cael`
- Display name: `Cael`
- Dialogue ID: `dlg_fringe_intro_cael`

Recommended format for future NPC IDs:

```text
lowercase_snake_case
```

Recommended format for future dialogue IDs:

```text
dlg_<location_or_context>_<npc_id>
```

This keeps scene exports, dialogue JSON, and quest event data easy to compare without renaming existing files.

## Dialogue Connection

Current flow:

1. `NPCBase` exposes `npc_id`, `display_name`, and `dialogue_id` as exported values.
2. The NPC scene assigns the concrete values.
3. When the player presses the `interact` action near the NPC, `NPCBase.interact()` asks `/root/DialogueManager` to start the configured `dialogue_id`.
4. `DemoController` preloads `game/data/dialogue/fringe_intro_dialogue.json` during `_ready()`.
5. `DialogueUI` renders the active dialogue node and forwards selected choices back to `DialogueManager`.

Current implemented dialogue link:

| NPC Scene | NPC ID | Dialogue JSON | Dialogue ID | Status |
| --- | --- | --- | --- | --- |
| `game/scenes/npc/cael_npc.tscn` | `cael` | `game/data/dialogue/fringe_intro_dialogue.json` | `dlg_fringe_intro_cael` | Connected |

## Quest Connection

Current flow:

1. `QuestManager` loads `game/data/quests/beginner_quests.json`.
2. Dialogue choices may include events with `type: quest_signal`.
3. `DialogueManager` forwards quest events to `/root/QuestManager`.
4. `QuestManager.apply_dialogue_event()` accepts, completes, fails, or updates an objective based on event fields.

Current implemented quest link:

| Dialogue File | Choice/Event | Quest File | Quest ID | Status |
| --- | --- | --- | --- | --- |
| `game/data/dialogue/fringe_intro_dialogue.json` | `ask_work` accepts quest | `game/data/quests/beginner_quests.json` | `BEG-001` | Connected |

## Future Schedule System

`NPCBase` already carries a schedule placeholder:

- `schedule_id`
- `schedule_state.enabled`
- `schedule_state.current_block`
- `schedule_state.future_schedule_source`

Recommended future schedule direction:

1. Add schedule data files under an existing data folder when the schedule system is implemented.
2. Keep `schedule_id` as the stable join key from NPC scenes to schedule data.
3. Use schedule blocks for time-of-day placement, availability, dialogue variants, and quest availability.
4. Keep dialogue and quest IDs separate from schedule IDs so scheduling can change without rewriting story data.
5. Add validation that every NPC with `schedule_state.enabled == true` has a matching schedule entry.

## Integration Notes

- Do not create new factions, cities, or main characters as part of NPC integration.
- Existing story NPC files remain source lore references, while `game/scenes/npc/` contains runtime NPC instances.
- Future NPC additions should reference approved story files first, then add scene/data links only after lore approval.
