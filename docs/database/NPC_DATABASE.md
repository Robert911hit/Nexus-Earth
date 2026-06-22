# Npc Database Specification

## Purpose

Defines production rules for storing and expanding Nexus Earth NPC data across Godot, FastAPI, PostgreSQL/Supabase, and the Next.js website.

## ID Format

Use `NPC-###` for authored content and `NPC-{region}-{shard}-{uuid}` for live player-scale records. IDs are immutable, lowercase slugs are display helpers only, and database primary keys must never depend on names.

## Naming Conventions

Names must be readable in UI, stable in markdown, and unique within a category. Do not rename approved lore entries; add aliases or localized display names instead.

## Relationships

Represent relationships with explicit foreign keys or join tables: source_id, target_id, relationship_type, canon_status, start_state, end_state, and notes. Avoid embedding critical references only in prose.

## Database Structure

Core tables should separate authored definitions from player state. Suggested tables: definitions, tags, relationships, unlock_rules, audit_log, player_instances, ownership_records, and version_history. Index IDs, slugs, category fields, region, owner_id, and updated_at for millions of players.

## Future Expansion Rules

Future cities, factions, and expansions must add new region codes and relationship records without rewriting existing canon. Content packages need version numbers, migration notes, rollback plans, and compatibility flags for Godot resources, FastAPI schemas, Supabase policies, and Next.js admin tools.
