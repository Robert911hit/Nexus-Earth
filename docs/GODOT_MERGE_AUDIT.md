# Godot Merge Audit

Date: 2026-06-22
Project: Nexus Earth
Scope: `game/project.godot`, Godot scripts, scenes, dialogue JSON, quest JSON, and current story NPC source folders.

## Summary

The merged Godot project is structurally present and uses Godot 4 project format. All `res://` paths declared in `game/project.godot` currently resolve to files in the `game/` directory. The requested autoloads are registered and their scripts exist.

One integration problem was found and fixed: `SaveSystem` called old save API names that do not exist on the current inventory, quest, and reputation managers, and demo code called a public `SaveSystem.sync_from_autoloads()` method that was not exposed. The fix connected `SaveSystem` to the existing manager serialization/load methods without changing lore, factions, cities, main characters, or file names.

## Checks Performed

- Parsed every `res://` path in `game/project.godot` and verified the target exists under `game/`.
- Verified required autoload registrations:
  - `SaveSystem`
  - `QuestManager`
  - `DialogueManager`
  - `InventoryManager`
  - `ReputationManager`
- Parsed every `.tscn` file under `game/scenes/` for external resource paths and verified those targets exist.
- Loaded every `.json` file under `game/data/dialogue/` and `game/data/quests/` with Python JSON parsing.
- Compared current dialogue quest events against loaded quest IDs.
- Compared current scene NPC dialogue IDs against loaded dialogue IDs.

## Problems Found

| Area | Problem | Impact | Status |
| --- | --- | --- | --- |
| Save system integration | `SaveSystem` referenced `InventoryManager.get_save_data()`, `QuestManager.get_save_data()`, and `ReputationManager.get_save_data()`, but the current managers expose `serialize_inventory()`, `serialize_progress()`, and `serialize_reputation()`. | Saving would fail when attempting to sync manager state. | Fixed. |
| Save system integration | `SaveSystem` referenced `InventoryManager.load_save_data()`, `QuestManager.load_save_data()`, and `ReputationManager.load_save_data()`, but the current managers expose `load_inventory()`, `load_progress()`, and `load_reputation()`. | Loading would fail when applying saved state to managers. | Fixed. |
| Demo save integration | `DemoController` calls `SaveSystem.sync_from_autoloads()`, but `SaveSystem` only had a private `_sync_from_autoloads()` method. | Pressing the save action or completing the demo quest would call a missing method. | Fixed by adding a public wrapper. |

## Missing Files

No missing files were found for the checked Godot references.

### `project.godot` Paths

| Path | Result |
| --- | --- |
| `res://scenes/demo/first_playable_demo.tscn` | Exists |
| `res://scripts/systems/save_system.gd` | Exists |
| `res://scripts/quest/quest_manager.gd` | Exists |
| `res://scripts/dialogue/dialogue_manager.gd` | Exists |
| `res://scripts/inventory/inventory_manager.gd` | Exists |
| `res://scripts/reputation/reputation_manager.gd` | Exists |

### Autoload Scripts

| Autoload | Script | Result |
| --- | --- | --- |
| `SaveSystem` | `res://scripts/systems/save_system.gd` | Exists |
| `QuestManager` | `res://scripts/quest/quest_manager.gd` | Exists |
| `DialogueManager` | `res://scripts/dialogue/dialogue_manager.gd` | Exists |
| `InventoryManager` | `res://scripts/inventory/inventory_manager.gd` | Exists |
| `ReputationManager` | `res://scripts/reputation/reputation_manager.gd` | Exists |

## Broken References

No missing `.tscn` script or packed-scene references were found.

| Scene | Referenced Resource | Result |
| --- | --- | --- |
| `game/scenes/demo/first_playable_demo.tscn` | `res://scripts/demo/demo_controller.gd` | Exists |
| `game/scenes/demo/first_playable_demo.tscn` | `res://scenes/player/player.tscn` | Exists |
| `game/scenes/demo/first_playable_demo.tscn` | `res://scenes/npc/cael_npc.tscn` | Exists |
| `game/scenes/demo/first_playable_demo.tscn` | `res://scenes/ui/dialogue_panel.tscn` | Exists |
| `game/scenes/demo/first_playable_demo.tscn` | `res://scenes/ui/quest_panel.tscn` | Exists |
| `game/scenes/npc/cael_npc.tscn` | `res://scripts/npc/npc_base.gd` | Exists |
| `game/scenes/player/player.tscn` | `res://scripts/player/player_controller.gd` | Exists |
| `game/scenes/ui/dialogue_panel.tscn` | `res://scripts/dialogue/dialogue_ui.gd` | Exists |
| `game/scenes/ui/quest_panel.tscn` | `res://scripts/quest/quest_ui.gd` | Exists |

## JSON Load Results

| File | JSON Status | Integration Notes |
| --- | --- | --- |
| `game/data/dialogue/fringe_intro_dialogue.json` | Valid JSON object | Dialogue ID `dlg_fringe_intro_cael` matches the Cael NPC scene dialogue ID. Dialogue quest event references `BEG-001`, which exists in quest data. |
| `game/data/quests/beginner_quests.json` | Valid JSON object | Quest ID `BEG-001` is present and contains objectives and rewards. |

## Recommended Fixes

1. Run the project in Godot 4.2+ and perform an editor import/open pass to catch engine-level scene warnings that static text parsing cannot detect.
2. Add automated Godot command-line smoke tests once a Godot binary is available in CI.
3. Add schema expectations for dialogue and quest JSON files, including required keys, supported event types, and quest objective event validation.
4. Replace the hard-coded fallback dialogue file in `NPCBase` with a data-driven NPC-to-dialogue registry when more NPCs are implemented.
5. Add save/load manual testing to confirm serialized dictionaries persist correctly under `user://nexus_earth_save.json`.

## Test Instructions

### Static Validation

From the repository root:

```bash
python3 - <<'PY'
import os, re, json, glob
root = 'game'
project = open('game/project.godot', encoding='utf-8').read()
for path in re.findall(r'res://[^"\)]+', project):
    assert os.path.exists(os.path.join(root, path[6:])), path
for scene in glob.glob('game/scenes/**/*.tscn', recursive=True):
    text = open(scene, encoding='utf-8').read()
    for path in re.findall(r'path="(res://[^"]+)"', text):
        assert os.path.exists(os.path.join(root, path[6:])), (scene, path)
for path in glob.glob('game/data/**/*.json', recursive=True):
    with open(path, encoding='utf-8') as handle:
        json.load(handle)
print('Godot static validation passed')
PY
```

### Manual Godot Test

1. Open `game/project.godot` in Godot 4.2 or newer.
2. Launch the main scene `res://scenes/demo/first_playable_demo.tscn`.
3. Move the player with `W`, `A`, `S`, and `D`.
4. Approach Cael and press `E` to open dialogue.
5. Choose the work option and confirm quest `BEG-001` appears in the quest UI.
6. Press `C` to complete the demo quest path.
7. Press `F5` to save and confirm no script errors occur.
