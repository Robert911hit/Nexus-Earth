# First Gameplay Loop

Date: 2026-06-22
Project: Nexus Earth
Scene: `res://scenes/demo/first_playable_demo.tscn`

## Purpose

The first playable demo now supports a complete beginner loop: the player meets Cael, accepts `BEG-001`, sees quest objectives, interacts with a Scrap Crate, returns to Cael, receives rewards, and persists the result through the save system.

## Player Flow

1. Launch the first playable demo.
2. Move with `W`, `A`, `S`, and `D`.
3. Approach Cael at the repair stall.
4. Press `E` to talk.
5. Choose the work dialogue option to accept `BEG-001`.
6. Read the active objective list in the Quest UI.
7. Walk to the nearby Scrap Crate.
8. Press `E` to search the Scrap Crate.
9. Confirm the Quest UI updates and the status prompt asks the player to return to Cael.
10. Return to Cael and press `E` to complete the quest.
11. Receive credits and Fringe reputation.
12. Save manually with `F5`, or rely on quest completion saving the loop state.

## Quest Flow

Quest `BEG-001` is the beginner quest used by the demo.

| Step | Objective ID | Completion Trigger |
| --- | --- | --- |
| 1 | `talk_to_cael` | The player completes Cael's acceptance dialogue after choosing the work option. |
| 2 | `search_scrap_crate` | The player interacts with the Scrap Crate while `BEG-001` is active. |
| 3 | `return_to_cael` | The player interacts with Cael after the first two objectives are complete. |

Rewards are data-driven from `game/data/quests/beginner_quests.json`:

- 50 credits
- +10 Fringe reputation
- Cael contact unlock metadata
- First shelter unlock metadata

## Dialogue Flow

1. Cael starts at dialogue ID `dlg_fringe_intro_cael`.
2. The player chooses **I need work.**
3. The dialogue choice emits a quest signal that accepts `BEG-001`.
4. Cael directs the player to search the Scrap Crate and return.
5. When the dialogue ends, the demo marks `talk_to_cael` complete if `BEG-001` is active.
6. Returning to Cael after searching the Scrap Crate completes the quest.

## Save Flow

The save file remains `user://nexus_earth_save.json` and includes:

- Player position and scene.
- Inventory state, including credits after reward payout.
- Quest state, including active/completed/failed quest dictionaries.
- Reputation state, including the Fringe reward.
- World interaction state for the Scrap Crate.

Save integration points:

1. Demo startup calls `SaveSystem.load_game()` and restores autoload state.
2. The Scrap Crate loads its searched/unsearched state from `current_save.world.scrap_crate`.
3. Searching the Scrap Crate syncs quest progress and world state into the active save dictionary.
4. Quest completion applies rewards, syncs all autoloads, records world state, and writes the save file.
5. Pressing `F5` manually syncs autoloads and the Scrap Crate state before saving.

## Validation Instructions

### Static Validation

From the repository root:

```bash
python3 - <<'PY'
import glob, json, os, re
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
print('First gameplay loop static validation passed')
PY
```

### Manual Godot Validation

1. Open `game/project.godot` in Godot 4.2 or newer.
2. Run `res://scenes/demo/first_playable_demo.tscn`.
3. Approach Cael and press `E`.
4. Choose **I need work.**
5. Confirm `BEG-001 - Find Your Feet` appears in the Quest UI.
6. Confirm `talk_to_cael` is marked complete after the dialogue closes.
7. Approach the Scrap Crate and press `E`.
8. Confirm `search_scrap_crate` is marked complete and the status label says to return to Cael.
9. Return to Cael and press `E`.
10. Confirm the quest completion popup appears.
11. Confirm the player receives 50 credits and +10 Fringe reputation in autoload state.
12. Press `F5`, restart the scene, and confirm completed quest, rewards, and Scrap Crate searched state persist.
