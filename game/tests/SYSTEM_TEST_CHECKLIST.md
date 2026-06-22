# System Test Checklist

Date: 2026-06-22
Project: Nexus Earth
Scene Under Test: `res://scenes/demo/first_playable_demo.tscn`

## Setup

- Open `game/project.godot` in Godot 4.2 or newer.
- Run the configured main scene.
- Confirm no script errors appear on startup.

## Player Movement

- [ ] Press `W` and confirm the player moves forward.
- [ ] Press `A` and confirm the player moves left.
- [ ] Press `S` and confirm the player moves backward.
- [ ] Press `D` and confirm the player moves right.
- [ ] Hold `Shift` while moving and confirm sprint speed is faster than walk speed.
- [ ] Stop input and confirm the player settles without sliding indefinitely.

## Dialogue

- [ ] Approach Cael until the interaction prompt appears.
- [ ] Press `E` and confirm the dialogue panel opens.
- [ ] Confirm the speaker label shows `Cael`.
- [ ] Select `I need work.` and confirm the next dialogue node appears.
- [ ] Select the ending response and confirm the dialogue panel closes.

## Quest Acceptance

- [ ] Trigger Cael's work dialogue option.
- [ ] Confirm quest `BEG-001` is accepted.
- [ ] Confirm the quest panel updates from `No active quests` to the active quest block.
- [ ] Confirm objectives display progress counters.

## Inventory

- [ ] Start the demo and confirm the access card is added through the demo controller setup.
- [ ] Complete the demo quest path with `C`.
- [ ] Confirm currency is added by the demo completion path.
- [ ] Confirm no inventory script errors occur when saving.

## Reputation

- [ ] Start the demo and confirm Fringe reputation initializes without script errors.
- [ ] Complete the demo quest path with `C`.
- [ ] Confirm reputation update signals do not produce errors.
- [ ] Confirm reputation remains clamped within the expected range of `-100` to `100`.

## Saving and Loading

- [ ] Press `F5` during the demo.
- [ ] Confirm `SaveSystem.save_game()` completes without script errors.
- [ ] Confirm a save file is written to `user://nexus_earth_save.json`.
- [ ] Restart the scene.
- [ ] Call `SaveSystem.load_game()` from the debugger or a temporary test harness.
- [ ] Confirm inventory, quest progress, and reputation load without script errors.

## Regression Notes

- If any test fails, record the scene, exact input, console error, and whether the issue is static data, scene wiring, or runtime logic.
- Do not modify lore, create factions, rename files, or delete files as part of test triage.
