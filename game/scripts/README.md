# Nexus Earth Godot Project

## Architecture

This folder is the Godot 4 client root for Nexus Earth. It follows the approved stack:

- Godot 4.x
- GDScript
- FastAPI backend integration points
- PostgreSQL/Supabase data ownership
- GitHub source control

## Folder Layout

- `project.godot` - Godot project settings, main scene, input actions, and autoload registrations.
- `scenes/` - Runtime scenes including playable demo, player, NPCs, and UI.
- `scripts/` - GDScript gameplay systems grouped by domain.
- `assets/` - Godot imported art, audio, animation, and placeholder assets.
- `ui/` - UI resources and reusable presentation assets.
- `data/` - JSON-driven game data.
- `tests/` - Validation and future automated testing.

## First Playable Prototype

The current prototype is:

`res://scenes/demo/first_playable_demo.tscn`

It includes:

- Player movement
- Cael NPC interaction
- JSON dialogue
- BEG-001 quest flow
- Inventory system
- Reputation system
- Save/load system

## Controls

- WASD - Move
- Shift - Sprint
- E - Interact
- C - Complete demo quest
- F5 - Save game

## System Boundaries

- Player movement supports future multiplayer replication.
- NPCs use stable IDs and dialogue connections.
- Dialogue is JSON-driven.
- Inventory supports stacking and saving.
- Reputation tracks Fringe, Gray Line, and Solenne.
- Save system supports future FastAPI/Supabase synchronization.
- Quests are data-driven.

## Testing

Validate JSON files, run Git diff checks, and test the project in Godot 4.x.