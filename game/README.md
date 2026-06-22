# Nexus Earth Godot Project

## Architecture

This folder is the Godot 4 client root for Nexus Earth.

Technology stack:

- Godot 4.x
- GDScript
- FastAPI backend integration points
- PostgreSQL/Supabase data ownership
- GitHub source control

## Folder Layout

- `project.godot` - Godot project settings, main scene, input actions, and autoload registrations.
- `scenes/` - Runtime scenes including playable demos, player scenes, NPCs, and UI.
- `scripts/` - GDScript gameplay systems grouped by domain.
- `assets/` - Godot imported assets, audio, models, textures, and placeholders.
- `ui/` - UI design notes, themes, and reusable presentation components.
- `data/` - JSON-driven game data such as dialogue and quests.
- `tests/` - Validation tools and future automated testing.

## First Playable Prototype

The first playable prototype uses:

- Player controller
- Cael NPC interaction
- JSON dialogue system
- BEG-001 quest flow
- Inventory system
- Reputation system
- Save/load system

Main prototype scene:

`res://scenes/demo/first_playable_demo.tscn`

## Controls

- `WASD` - Move
- `Shift` - Sprint
- `E` - Interact with NPCs
- `C` - Complete demo quest objectives
- `F5` - Save game state

## System Boundaries

- Player movement is designed for future multiplayer expansion.
- NPC systems use stable IDs and interaction hooks.
- Dialogue is JSON-driven for easy content expansion.
- Inventory supports item storage and save/load.
- Reputation tracks relationships with factions and locations.
- Save systems are versioned for future FastAPI/Supabase synchronization.
- Quest systems are data-driven and connected to future databases.

## Multiplayer Readiness

All gameplay systems are designed with:

- Stable IDs
- Serializable data
- Expandable systems
- Future backend synchronization

This allows future connection between Godot, FastAPI, PostgreSQL/Supabase, and the Nexus Earth online world.

## Testing Instructions

Until automated Godot CI is added:

1. Open the project in Godot 4.x.
2. Run the main scene.
3. Test player movement.
4. Test NPC interaction.
5. Test dialogue.
6. Test quest completion.
7. Test saving and loading.