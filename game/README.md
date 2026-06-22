# Nexus Earth Godot Project

## Architecture

This folder is the Godot client root for Nexus Earth. It follows the approved stack: Godot 4.x, GDScript, FastAPI backend integration points, PostgreSQL/Supabase data ownership, and GitHub source control.

## Folder Layout

- `project.godot` - Godot project settings and autoload registrations.
- `scenes/` - Runtime scenes, including player, UI, and main bootstrap scenes.
- `scripts/` - GDScript gameplay systems grouped by domain.
- `assets/` - Godot-local imported art, audio, animation, and placeholder assets.
- `ui/` - UI design notes, themes, and reusable presentation assets.
- `data/` - JSON-driven local definitions mirrored from future authored databases.
- `tests/` - Lightweight validation scripts and future Godot test scenes.

## System Boundaries

- Player movement is local-authoritative for prototype work, but exposes serializable state for future multiplayer replication.
- Dialogue is JSON-driven so writers can add NPC conversations without changing code.
- Saves are dictionary-based and versioned so FastAPI/Supabase sync can be added later.
- Quests are data-driven and designed to read exported JSON generated from `story/quests/QUEST_DATABASE.md` or future database tables.

## Multiplayer Readiness

All gameplay systems expose stable IDs, serializable dictionaries, and update methods that can later be routed through Godot multiplayer RPCs or backend-authoritative FastAPI services.
