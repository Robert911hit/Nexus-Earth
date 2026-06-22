# Nexus Earth Godot Project

## Architecture

This folder is the Godot 4 client root for Nexus Earth. It follows the approved stack: Godot 4.x, GDScript, FastAPI backend integration points, PostgreSQL/Supabase data ownership, and GitHub source control.

## Folder Layout

- `project.godot` - Godot project settings, main demo scene, input actions, and autoload registrations.
- `scenes/` - Runtime scenes, including the first playable demo, player, NPCs, and UI.
- `scripts/` - GDScript gameplay systems grouped by domain.
- `assets/` - Godot-local imported art, audio, animation, and placeholder assets.
- `ui/` - UI design notes, themes, and reusable presentation assets.
- `data/` - JSON-driven local definitions mirrored from future authored databases.
- `tests/` - Lightweight validation scripts and future Godot test scenes.

## First Playable Prototype

Open `res://scenes/demo/first_playable_demo.tscn` or run the project. The prototype includes a controllable player, Cael as an interactable NPC, JSON dialogue, BEG-001 quest acceptance, objective completion, quest completion popup, starter inventory, and Fringe reputation changes.

## Controls

- `WASD` - Move.
- `Shift` - Sprint.
- `E` - Interact with nearby NPCs.
- `C` - Complete the BEG-001 demo objectives and trigger the quest completion flow.
- `F5` - Save player, inventory, quest, and reputation state.

## System Boundaries

- Player movement is local-authoritative for prototype work, but exposes serializable state for future multiplayer replication.
- NPCs are Area3D interactables with stable IDs, display names, dialogue IDs, and schedule placeholders.
- Dialogue is JSON-driven so writers can add NPC conversations without changing code.
- Inventory supports add, remove, stacking, and save/load serialization.
- Reputation tracks Fringe, Gray Line, and Solenne standing.
- Saves are dictionary-based and versioned so FastAPI/Supabase sync can be added later.
- Quests are data-driven and designed to read exported JSON generated from `story/quests/QUEST_DATABASE.md` or future database tables.

## Testing Instructions

Until headless Godot CI is installed, validate JSON with Python, run `git diff --check`, and open `game/project.godot` locally in Godot 4.x to run `first_playable_demo.tscn`.
