# Game Tests

This folder is reserved for Godot-native tests and lightweight validation scripts.

Current validation relies on repository-level checks because the container does not include a Godot executable. Future CI should run Godot in headless mode with scene load checks for `project.godot`, autoload scripts, player movement, dialogue loading, save serialization, and quest state transitions.
