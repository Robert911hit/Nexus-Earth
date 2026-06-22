# Game Data

Local JSON files in this folder are prototype exports from approved markdown databases.

They are intentionally data-driven so future FastAPI and Supabase tools can generate identical files for offline play, development builds, and future multiplayer systems.

## Folder Structure

- `dialogue/` stores NPC dialogue graphs.
- `quests/` stores quest definitions exported from approved quest databases.
- `player/` is reserved for local fixtures and future default player state.

## Data Rules

- JSON files must follow approved database structures.
- Do not create conflicting IDs.
- Lore data must match approved story files.
- Future systems should read from these files instead of hardcoding content.