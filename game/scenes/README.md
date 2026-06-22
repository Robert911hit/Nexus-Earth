# Game Scenes

The scenes folder contains all Godot runtime scenes for Nexus Earth.

## Scene Structure

- `demo/first_playable_demo.tscn` is the current first playable prototype scene.
- `main.tscn` is retained as a minimal bootstrap scene for future use.
- `player/` stores player-controlled actor scenes.
- `npc/` stores interactable NPC scenes such as Cael.
- `ui/` stores reusable UI scenes such as dialogue and quest panels.

## Scene Rules

- Scenes should remain modular and reusable.
- Gameplay logic belongs in scripts, not hardcoded inside scenes.
- New scenes must follow Nexus Earth architecture rules.