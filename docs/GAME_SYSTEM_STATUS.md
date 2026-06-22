# Game System Status

Date: 2026-06-22
Project: Nexus Earth
Engine Target: Godot 4.2+

## Current Systems

| System | Primary Files | Current Status |
| --- | --- | --- |
| Project configuration | `game/project.godot` | Defines project metadata, main demo scene, input actions, and five autoload managers. |
| Save system | `game/scripts/systems/save_system.gd` | Connected to inventory, quest, and reputation serialization/load methods. |
| Dialogue system | `game/scripts/dialogue/dialogue_manager.gd`, `game/scripts/dialogue/dialogue_ui.gd` | Loads dialogue JSON, starts dialogue by ID, displays nodes, applies dialogue quest events. |
| Quest system | `game/scripts/quest/quest_manager.gd`, `game/scripts/quest/quest_ui.gd` | Loads quest JSON, accepts quests, updates objectives, completes/fails quests, displays active objectives. |
| Inventory system | `game/scripts/inventory/inventory_manager.gd` | Tracks item quantities and serializes inventory arrays for saving. |
| Reputation system | `game/scripts/reputation/reputation_manager.gd` | Tracks existing reputation channels and serializes reputation dictionaries for saving. |
| Player system | `game/scripts/player/player_controller.gd`, `game/scenes/player/player.tscn` | Provides local movement, sprinting, gravity, and a simple replicated-state structure. |
| NPC interaction | `game/scripts/npc/npc_base.gd`, `game/scenes/npc/cael_npc.tscn` | Provides interaction detection, dialogue launch, and future schedule state placeholder. |
| Demo integration | `game/scripts/demo/demo_controller.gd`, `game/scenes/demo/first_playable_demo.tscn` | Loads demo data, connects UI, NPC, quest completion, inventory, reputation, and save actions. |

## Existing Files Reviewed

### Godot Configuration

- `game/project.godot`

### Scripts

- `game/scripts/demo/demo_controller.gd`
- `game/scripts/dialogue/dialogue_manager.gd`
- `game/scripts/dialogue/dialogue_ui.gd`
- `game/scripts/inventory/inventory_manager.gd`
- `game/scripts/npc/npc_base.gd`
- `game/scripts/player/player_controller.gd`
- `game/scripts/quest/quest_manager.gd`
- `game/scripts/quest/quest_ui.gd`
- `game/scripts/reputation/reputation_manager.gd`
- `game/scripts/systems/save_system.gd`

### Scenes

- `game/scenes/main.tscn`
- `game/scenes/demo/first_playable_demo.tscn`
- `game/scenes/npc/cael_npc.tscn`
- `game/scenes/player/player.tscn`
- `game/scenes/ui/dialogue_panel.tscn`
- `game/scenes/ui/quest_panel.tscn`

### Data

- `game/data/dialogue/fringe_intro_dialogue.json`
- `game/data/quests/beginner_quests.json`

## What Works

- Required autoloads are registered in `game/project.godot` and point to existing scripts.
- Main scene path points to the existing first playable demo scene.
- Scene script references resolve to existing files.
- Dialogue JSON and quest JSON parse successfully.
- Cael's scene dialogue ID matches the loaded dialogue data ID.
- Dialogue event quest ID `BEG-001` matches the loaded quest data.
- Save integration now calls the currently implemented manager APIs.

## What Needs Testing

- Runtime Godot launch and editor import pass.
- Dialogue UI choice selection in an actual Godot session.
- Quest UI refresh and completion popup behavior after accepting and completing `BEG-001`.
- Save file creation at `user://nexus_earth_save.json`.
- Load behavior after restarting the scene.
- Player/NPC interaction detection with the current Area3D/CharacterBody3D collision setup.
- Whether `game/scenes/main.tscn` should remain a placeholder or become an integration scene later.

## Missing Dependencies

No missing repository files were found for current project, scene, autoload, dialogue, or quest references.

External runtime dependency still required for full validation:

- Godot 4.2 or newer command-line/editor binary.

## Fixes Made

- Added public `SaveSystem.sync_from_autoloads()` wrapper for existing demo calls.
- Updated save sync to call:
  - `InventoryManager.serialize_inventory()`
  - `QuestManager.serialize_progress()`
  - `ReputationManager.serialize_reputation()`
- Updated save load application to call:
  - `InventoryManager.load_inventory()`
  - `QuestManager.load_progress()`
  - `ReputationManager.load_reputation()`
