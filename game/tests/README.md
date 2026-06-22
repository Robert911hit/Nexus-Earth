# Game Tests

## Current Manual Validation

The first playable prototype should be tested in Godot 4.x by opening `game/project.godot` and running `res://scenes/demo/first_playable_demo.tscn`.

Expected flow:

1. Move the player with `WASD` and sprint with `Shift`.
2. Walk near Cael and press `E` when the interaction prompt appears.
3. Choose `I need work.` to accept `BEG-001` through the JSON dialogue event.
4. Confirm the quest appears in the active quest panel.
5. Press `C` to simulate completing the prototype objectives.
6. Confirm the quest completion popup appears, Fringe reputation increases, and reward currency is added to inventory.
7. Press `F5` to save player position, inventory, quest progress, and reputation.

## Automated Validation Roadmap

Future CI should run Godot in headless mode to load the demo scene, instantiate autoloads, validate dialogue JSON, validate quest JSON, assert inventory stack behavior, assert reputation bounds, and assert save/load round trips.
