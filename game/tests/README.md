# Game Tests

## Current Manual Validation

The first playable prototype should be tested in Godot 4.x by opening:

`game/project.godot`

and running:

`res://scenes/demo/first_playable_demo.tscn`

Expected flow:

1. Move the player with `WASD` and sprint with `Shift`.
2. Walk near Cael and press `E` when the interaction prompt appears.
3. Choose `I need work.` to accept `BEG-001` through the JSON dialogue event.
4. Confirm the quest appears in the active quest panel.
5. Press `C` to simulate completing the prototype objectives.
6. Confirm the quest completion popup appears, Fringe reputation increases, and reward currency is added.
7. Press `F5` to save player position, inventory, quest progress, and reputation.

## Repository Validation

Current validation should include:

- Checking JSON dialogue files.
- Checking JSON quest files.
- Running `git diff --check`.
- Confirming autoload scripts exist.
- Confirming scene references are valid.

## Automated Validation Roadmap

Future CI should run Godot in headless mode to:

- Load project.godot.
- Validate autoload scripts.
- Load demo scenes.
- Validate dialogue JSON.
- Validate quest JSON.
- Test inventory behavior.
- Test reputation limits.
- Test save/load functionality.
- Verify quest state transitions.

Until Godot CI exists, testing must be performed locally using Godot 4.x.