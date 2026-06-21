# Nexus Earth Quest Database

## Status

Official Document

## Version

1.0

## Overview

This document defines all approved quest chains for Nexus Earth.

Each quest chain is modular and expandable.

New quests must follow the ID format and dependency structure defined here.

---

## Quest ID Format

```
[CHAIN CODE]-[NUMBER]

Examples:
BEG-001
GRL-001
RHD-001
SOL-001
FRG-001
```

---

## Chain Index

| Chain Code | Chain Name | Quests |
|---|---|---|
| BEG | First Steps Unregistered | 5 |
| GRL | The Weight of Discretion | 7 |
| RHD | The First Unregistered | 8 |
| SOL | The Architecture of Order | 7 |
| FRG | This Is How We Stay | 6 |

---

---

# CHAIN: BEG — First Steps Unregistered

## Chain Overview

The player's introduction to Nexus Earth.

Teaches core systems, establishes The Fringe as home base, and plants the first ambient reference to Robert Hit Dev.

No faction alignment required.

No prior quests required.

---

## BEG-001

**Quest Name:** Find Your Feet

**Starting NPC:** Cael (Fringe logistics worker, repair stall near border checkpoint)

**Objectives:**
- Pass through the Solenne border checkpoint into The Fringe
- Locate basic shelter
- Acquire basic supplies from the informal market
- Speak with Cael at his repair stall

**Rewards:**
- First shelter location unlocked in The Fringe
- Small currency amount
- Cael added as active contact

**Dependencies:**
- None — opening quest

**Story Impact:**
Establishes the player as a new Unregistered arrival in The Fringe.
Introduces the district's layout, population, and informal economy.
Cael becomes a recurring minor contact throughout the game.

---

## BEG-002

**Quest Name:** Earn Your Keep

**Starting NPC:** Cael

**Objectives:**
- Accept a delivery job from Cael
- Deliver a package to a designated contact inside The Fringe
- Return to Cael and confirm completion

**Rewards:**
- Currency payment
- First reputation point with Fringe residents
- Introduction to the informal trade system

**Dependencies:**
- BEG-001 complete

**Story Impact:**
Player begins building standing in The Fringe community.
Introduces the reputation system through natural gameplay rather than tutorial prompts.

---

## BEG-003

**Quest Name:** Someone Else's Problem

**Starting NPC:** Cael

**Objectives:**
- Accept a job that involves a minor complication mid-delivery
- Navigate the complication using available options
- Resolve the situation and complete the delivery
- Report outcome to Cael

**Rewards:**
- Currency payment
- Reputation shift based on resolution method
- Introduction to Fringe informal rules

**Dependencies:**
- BEG-002 complete

**Story Impact:**
Player makes their first minor moral choice.
The resolution method is remembered by Fringe residents and referenced in later quests.
Introduces the principle that The Fringe operates on unwritten rules as much as written ones.

---

## BEG-004

**Quest Name:** The Name on the Wall

**Starting NPC:** Cael (ambient trigger — no formal assignment)

**Objectives:**
- Complete a job that takes the player into an older section of The Fringe
- Encounter a piece of graffiti, a worn poster, or a written quote attributed to Robert Hit Dev
- Optional: ask Cael about the name afterward

**Rewards:**
- No material reward
- First lore entry unlocked: Robert Hit Dev (basic)

**Dependencies:**
- BEG-003 complete

**Story Impact:**
First ambient introduction of Robert Hit Dev's name.
No quest attached to the name at this stage.
If the player asks Cael, he acknowledges the name briefly and matter-of-factly.
Plants the foundation for the Robert Hit Dev mystery chain without directing the player toward it.

---

## BEG-005

**Quest Name:** Standing on Your Own

**Starting NPC:** Cael

**Objectives:**
- Accept a task that requires independent operation without Cael's direct involvement
- Handle a minor dispute or situation between two Fringe residents
- Reach a resolution
- Report back to Cael

**Rewards:**
- Currency payment
- Fringe reputation increase
- Safe shelter upgraded to permanent location
- Beginner chain marked complete

**Dependencies:**
- BEG-004 complete

**Story Impact:**
Player is now established in The Fringe as a known and functional Unregistered individual.
The resolution of the resident dispute has minor long-term consequences that surface in FRG-005 and FRG-006.
Unlocks access to GRL, RHD, SOL, and FRG chains based on player activity.

---

---

# CHAIN: GRL — The Weight of Discretion

## Chain Overview

The player is recruited by Sable Orin and integrated into The Gray Line's operations.

The chain begins as professional contract work and escalates into a personal investigation connected to Robert Hit Dev's disappearance.

Requires BEG chain complete.

---

## GRL-001

**Quest Name:** The First Contract

**Starting NPC:** Sable Orin

**Objectives:**
- Meet Sable Orin at Orin Transit
- Accept a smuggling delivery contract
- Move the package through a Fringe checkpoint without triggering registration systems
- Confirm delivery to Sable's designated contact
- Return to Sable

**Rewards:**
- Gray Line introductory payment
- Sable Orin added as active contact
- Orin Transit added as known location

**Dependencies:**
- BEG-005 complete
- Player must have been observed by Sable completing a prior Fringe job (passive trigger)

**Story Impact:**
Player is formally introduced to The Gray Line as an organization and to Sable as its representative.
Establishes the professional tone of the relationship: reliable work earns access; nothing else does.

---

## GRL-002

**Quest Name:** Moving People

**Starting NPC:** Sable Orin

**Objectives:**
- Accept a contract to transport an individual through Solenne without triggering city registration
- Navigate the route using Gray Line methods
- Deliver the individual safely to the designated location
- Do not ask about the individual's identity (breakable objective — player choice)

**Rewards:**
- Significant currency payment
- Introduction to Gray Line identity services
- Access to first Gray Line safe house location

**Dependencies:**
- GRL-001 complete

**Story Impact:**
Introduces the ethical complexity of Gray Line work — discretion as a professional standard and a personal challenge.
If the player breaks the discretion objective and learns who they are moving, this information becomes available for use or misuse later in the chain.
Sable notes the breach without punishing it — once.

---

## GRL-003

**Quest Name:** The Information Market

**Starting NPC:** Sable Orin

**Objectives:**
- Accept an information brokering contract
- Locate and acquire a specific piece of information from a Fringe source
- Deliver the information to Sable's designated buyer without copying or retaining it
- Confirm completion

**Rewards:**
- Currency payment
- Gray Line intelligence network access (tier 1)
- Second safe house location unlocked

**Dependencies:**
- GRL-002 complete

**Story Impact:**
Establishes that The Gray Line trades in information as much as goods.
Introduces the intelligence network as a gameplay system.
Player begins to understand that their discretion is their most valuable Gray Line asset.

---

## GRL-004

**Quest Name:** Internal Standards

**Starting NPC:** Sable Orin

**Objectives:**
- Receive assignment to investigate a Gray Line contractor who has broken a core principle
- Locate and confront the contractor
- Determine the nature and extent of the breach
- Decide how to handle the contractor: report to Sable, resolve independently, or cover it

**Rewards:**
- Currency payment
- Sable's trust rating increases
- Outcome recorded in Gray Line reputation profile

**Dependencies:**
- GRL-003 complete

**Story Impact:**
Introduces Gray Line internal culture and the consequences of failure within the organization.
Player's handling method shapes how the Gray Line perceives them going forward.
The contractor, depending on resolution, may become a minor recurring character or a permanent removal from the game world.

---

## GRL-005

**Quest Name:** Old Channels

**Starting NPC:** Sable Orin

**Objectives:**
- Accept a job requiring use of a Gray Line route that has been inactive for years
- Navigate the route and complete the delivery
- During navigation, discover physical evidence that the route was active during the period of Robert Hit Dev's disappearance
- Return to Sable and decide whether to mention what was found

**Rewards:**
- Currency payment
- Old route added to travel network
- Lore entry unlocked: Gray Line Historical Operations (partial)

**Dependencies:**
- GRL-004 complete

**Story Impact:**
First direct intersection of Gray Line work with the Robert Hit Dev mystery.
Sable's reaction to any mention of the discovery is the first visible crack in her professional composure.
Players who notice and remember this moment will be prepared for what GRL-006 reveals.
This quest passively unlocks the RHD chain if the player has not already started it.

---

## GRL-006

**Quest Name:** Sable's Question

**Starting NPC:** Sable Orin

**Objectives:**
- Meet Sable at a private Gray Line location outside normal operational spaces
- Receive her account of what she has been investigating
- Accept the assignment to locate a specific set of missing Gray Line records
- Navigate opposition from parties who have ensured those records remain missing
- Retrieve the records or confirm their current location

**Rewards:**
- Significant currency payment
- Gray Line full membership confirmed
- All Gray Line safe house locations unlocked
- Smuggling routes across The Fringe and into Solenne unlocked

**Dependencies:**
- GRL-005 complete

**Story Impact:**
Sable shares her private investigation for the first time.
The player becomes an active partner in something Sable has carried alone for six years.
Opposition encountered during the records search connects to parties inside Solenne — foreshadowing the SOL chain.

---

## GRL-007

**Quest Name:** What the Records Say

**Starting NPC:** Sable Orin

**Objectives:**
- Deliver the recovered records to Sable
- Review the contents together
- Choose from three options for what to do with the information:
  - Option A: Secure the records inside Gray Line channels and use them as leverage
  - Option B: Pass the records to an outside party (Ezra Voss, Maren Solis, or a third party)
  - Option C: Destroy the records to protect the Gray Line from exposure

**Rewards:**
- Gray Line chain complete
- Outcome-dependent rewards based on chosen option
- A key piece of the Robert Hit Dev mystery delivered regardless of option chosen

**Dependencies:**
- GRL-006 complete

**Story Impact:**
The records confirm that the Gray Line was used the night Robert Hit Dev disappeared and identify what was moved.
Player's choice in this quest directly affects the RHD chain (what evidence Ezra Voss has access to) and the SOL chain (whether Maren Solis receives information that changes her position).
Sable's personal arc continues in side content based on this outcome.
Option C locks one branch of the RHD chain permanently for this playthrough.

---

---

# CHAIN: RHD — The First Unregistered

## Chain Overview

The game's central narrative thread.

Follows the mystery of Robert Hit Dev's disappearance through Ezra Voss's knowledge, documentary evidence, and cross-chain information gathered across the game.

Cannot be completed without progress in at least one other chain.

Requires BEG chain complete.

Interacts directly with GRL-007 and SOL-005 outcomes.

---

## RHD-001

**Quest Name:** The Historian

**Starting NPC:** Ezra Voss

**Objectives:**
- Locate Ezra Voss in The Fringe
- Engage in a genuine conversation about the Unregistered movement
- Accept Ezra's research task: locate a specific Fringe resident who has a personal connection to Robert Hit Dev's early community
- Find the resident and conduct an interview
- Return the information to Ezra

**Rewards:**
- Ezra Voss added as active contact
- Lore entry unlocked: The Unregistered Movement (early history)
- Ezra's apartment marked as accessible location

**Dependencies:**
- BEG-005 complete
- At least two missions from any other chain complete (demonstrates player has roots in the world)

**Story Impact:**
Establishes Ezra as a trustworthy source of real historical information rather than rumor.
The resident located becomes a minor recurring character in The Fringe.
Ezra begins evaluating the player's motivations without stating that he is doing so.

---

## RHD-002

**Quest Name:** The Archive

**Starting NPC:** Ezra Voss

**Objectives:**
- Receive partial access to Ezra's physical archive
- Review available materials related to Robert Hit Dev's public activities before his disappearance
- Identify three specific gaps or inconsistencies in the official record
- Report findings to Ezra

**Rewards:**
- Archive access (partial) unlocked as ongoing lore system
- Lore entries unlocked: Robert Hit Dev — Public Record, Official Account of Disappearance
- Ezra's trust rating increases

**Dependencies:**
- RHD-001 complete

**Story Impact:**
Player begins building an evidence-based understanding of the Robert Hit Dev case rather than relying on rumor.
The three inconsistencies identified become specific objectives in later quests.
Ezra notes how the player engages with the material — whether they look for confirmation of what they already believe or follow where the evidence leads.

---

## RHD-003

**Quest Name:** The Manifesto's Missing Pages

**Starting NPC:** Ezra Voss

**Objectives:**
- Learn from Ezra that the publicly circulating Unregistered Manifesto is incomplete
- Locate three separate physical copies of missing sections across The Fringe
- Each location requires a different approach to access
- Deliver all recovered sections to Ezra

**Rewards:**
- The Unregistered Manifesto (complete) unlocked as unique in-game item
- Lore entry unlocked: The Unregistered Manifesto — Full Text
- Significant Fringe reputation increase

**Dependencies:**
- RHD-002 complete

**Story Impact:**
The complete Manifesto contains ideas that the incomplete version does not — specifically, passages that suggest Robert Hit Dev anticipated that he would be targeted.
This reframes the mystery: not whether something happened to him, but whether he prepared for it.
The factions react differently to the complete Manifesto becoming known — The Manifesto faction experiences a significant internal moment; Solenne Integrated Systems registers an alert.

---

## RHD-004

**Quest Name:** The People He Knew

**Starting NPC:** Ezra Voss

**Objectives:**
- Receive a list of four elderly Fringe residents who knew Robert Hit Dev personally
- Locate and speak with each resident
- Each conversation requires a different approach based on the resident's personality and situation
- Compile their accounts and return to Ezra

**Rewards:**
- Currency payment (Ezra pays for the research)
- Lore entries unlocked: four individual testimonies
- Ezra's trust rating increases significantly

**Dependencies:**
- RHD-003 complete

**Story Impact:**
The four accounts collectively describe a man who knew something was approaching and was preparing for it — but none of them knew what he was preparing.
The picture they form is of someone who trusted people carefully and had already begun to conceal something important.
One of the four residents mentions a specific name connected to a Solenne department — the same department referenced in the SOL chain.

---

## RHD-005

**Quest Name:** The Night in Question

**Starting NPC:** Ezra Voss

**Objectives:**
- Using information from RHD-002 through RHD-004, the Gray Line chain (if completed), and the archive, reconstruct the timeline of Robert Hit Dev's final known days
- Identify four specific events that occurred in the 48 hours before his disappearance
- Present the reconstructed timeline to Ezra
- Ezra confirms, corrects, or adds to the reconstruction

**Rewards:**
- Lore entry unlocked: The Final Days — Reconstructed Timeline
- One piece of evidence delivered that directly contradicts the official disappearance record
- Access to RHD-006 unlocked

**Dependencies:**
- RHD-004 complete
- At least one of the following: GRL-005 complete OR SOL-003 complete

**Story Impact:**
The reconstructed timeline proves the official account is false in at least one specific and documentable way.
Players who have completed GRL-005 or GRL-007 have access to additional evidence that makes the timeline more precise.
Ezra's reaction to the completed timeline is the first moment in the chain where his composure genuinely shifts.

---

## RHD-006

**Quest Name:** Maren Solis Knows

**Starting NPC:** Ezra Voss (provides the lead) — operational execution varies

**Objectives:**
- Receive information pointing toward Solenne Integrated Systems and a classified former department
- Access Solenne to investigate the former department's records
- Access method depends on player's progress in other chains:
  - Gray Line contacts (requires GRL-003 or higher)
  - Maren Solis (requires SOL-003 or higher)
  - Independent infiltration (available always, higher risk)
- Retrieve evidence connecting the former department to the night of Robert Hit Dev's disappearance
- Exit Solenne without triggering a full corporate response

**Rewards:**
- Evidence package: Solenne institutional connection confirmed
- Lore entry unlocked: The Classified Division
- Major progress toward SOL chain if not yet complete

**Dependencies:**
- RHD-005 complete
- At least one access method available (see objectives)

**Story Impact:**
Confirms institutional involvement in Robert Hit Dev's disappearance at the level of Solenne Integrated Systems.
The specific evidence found varies based on access method used.
If Maren Solis is used as the access point, this triggers an immediate response in the SOL chain — she now knows the player is pursuing this directly.
If Gray Line contacts are used, Sable Orin learns what the player found, affecting her arc.

---

## RHD-007

**Quest Name:** The Last Conversation

**Starting NPC:** Ezra Voss

**Objectives:**
- Return to Ezra with all evidence gathered across the chain
- Present the complete picture of what happened to Robert Hit Dev
- Listen as Ezra tells the player what Robert said to him in their final conversation
- Receive the information Ezra has been carrying for decades

**Rewards:**
- Lore entry unlocked: The Last Conversation — Ezra's Account
- The truth of what Robert Hit Dev discovered before his disappearance
- Ezra Voss relationship reaches maximum trust level

**Dependencies:**
- RHD-006 complete

**Story Impact:**
The emotional center of the entire chain.
What Robert told Ezra reframes the entire mystery and reveals the specific thing that made him a target.
The player now knows more about Robert Hit Dev's disappearance than anyone alive outside a small circle of powerful individuals.
Ezra's personal weight — why he stayed silent for so long — is fully explained here without justification or excuse.
This quest cannot be reversed or avoided once begun.

---

## RHD-008

**Quest Name:** What You Do With the Truth

**Starting NPC:** Ezra Voss (delivers final choice framing)

**Objectives:**
- Choose one of four paths for what to do with the complete truth of Robert Hit Dev's disappearance:
  - Path A — Release: Distribute the complete evidence through available networks (Fringe community, The Manifesto faction, outside journalists)
  - Path B — Leverage: Use the evidence as private leverage against Solenne Integrated Systems through Maren Solis or Gray Line channels
  - Path C — Contain: Work with Maren Solis to manage the truth's release in a controlled way that reforms from within
  - Path D — Protect: Secure the evidence in Ezra's archive and ensure it survives without releasing it now

**Rewards:**
- Robert Hit Dev Mystery Chain complete
- Outcome-dependent world state changes (faction power shifts, NPC responses, available late-game content)
- Unique player title reflecting chosen path
- Ezra Voss as permanent companion contact regardless of path chosen

**Dependencies:**
- RHD-007 complete

**Story Impact:**
The highest story impact of any quest in Nexus Earth.
Each path produces genuinely different world outcomes:
- Path A shifts power toward Fringe and independent communities; Solenne faces public pressure
- Path B gives the player and Gray Line significant political leverage; status quo is maintained but under pressure
- Path C enables Maren Solis to lead internal reform; slowest change, most stable outcome
- Path D preserves the truth for future players or late-game expansion; no immediate world change
Player's chosen path is visible to other players in community spaces and shapes late-game content availability.

---

---

# CHAIN: SOL — The Architecture of Order

## Chain Overview

The player is recruited by Maren Solis into Solenne Integrated Systems' unofficial operations.

The chain explores institutional power, complicity, and whether broken systems can be repaired from within.

Interacts directly with RHD-006 and GRL-007 outcomes.

Requires BEG chain complete.

---

## SOL-001

**Quest Name:** The Invitation

**Starting NPC:** Maren Solis

**Objectives:**
- Receive an approach from Maren Solis near The Fringe border administration
- Meet Maren at an official Community Integration office inside Solenne
- Accept a contract to handle a sensitivity issue in The Fringe that her regular staff cannot address without political complications
- Complete the task in The Fringe
- Report outcome to Maren

**Rewards:**
- Maren Solis added as active contact
- Community Integration Office added as accessible location
- Guest access to Solenne interior districts unlocked (limited)
- Currency payment

**Dependencies:**
- BEG-005 complete
- Player must have been noted by Maren's monitoring systems for activity in The Fringe (passive trigger after BEG chain)

**Story Impact:**
Maren's evaluation of the player begins.
The sensitivity issue resolved in The Fringe has a minor impact on Fringe community dynamics, intersecting with the FRG chain if active.
Player experiences the interior of Solenne for the first time through legitimate, if unofficial, access.

---

## SOL-002

**Quest Name:** Inside the City

**Starting NPC:** Maren Solis

**Objectives:**
- Accept a contract requiring operation inside Solenne's interior districts
- Complete an assigned task inside The Bloom or The Exchange
- Navigate the social and surveillance environment of Solenne as an Unregistered operative
- Return to Maren with results

**Rewards:**
- Currency payment
- Interior Solenne navigation unlocked
- Lore entries unlocked: The Bloom, The Exchange
- Solenne access level increased

**Dependencies:**
- SOL-001 complete

**Story Impact:**
Player experiences what life with corporate citizenship looks and feels like from the inside.
The contrast with The Fringe is intentional and designed to create moral ambiguity rather than clear judgment.
Maren's professionalism in this environment provides context for understanding her position within the institution.

---

## SOL-003

**Quest Name:** The Department That Doesn't Exist

**Starting NPC:** Maren Solis (indirect — triggered by player research during an assignment)

**Objectives:**
- While completing a Maren assignment, encounter an administrative reference to a department designation that predates her current division
- Investigate the reference through available means
- Raise the finding with Maren
- Observe and record her response

**Rewards:**
- Lore entry unlocked: Administrative Anomaly — Pre-Division Records
- Maren's controlled reaction noted in relationship file
- Access to SOL-004 unlocked

**Dependencies:**
- SOL-002 complete

**Story Impact:**
First visible crack in Maren's professional composure.
Her response is controlled and precise in a way that is itself informative to an observant player.
This quest passively advances the RHD chain — the department reference is the same one encountered in RHD-004.
Players running both chains simultaneously begin to see the connections forming.

---

## SOL-004

**Quest Name:** Political Currency

**Starting NPC:** Maren Solis

**Objectives:**
- Receive assignment to resolve a conflict between two Solenne corporate factions
- Maren cannot resolve it through official channels without exposing her own political position
- Navigate negotiations between the two factions
- Reach a resolution that satisfies Maren's requirements without escalating publicly

**Rewards:**
- Significant currency payment
- Introduction to Solenne's internal political landscape
- Two new corporate contacts added
- Solenne access level increased again

**Dependencies:**
- SOL-003 complete

**Story Impact:**
Introduces the currency of favors as a Solenne political mechanic.
The two factions involved are not equivalent — one has connections that will resurface in SOL-006.
The resolution method shapes which faction owes the player and which resents them — both become relevant in late Solenne content.

---

## SOL-005

**Quest Name:** What She Knows

**Starting NPC:** Maren Solis

**Objectives:**
- Receive a private disclosure from Maren — a carefully chosen piece of information about Solenne's history that she has never officially disclosed
- Decide how to use the information:
  - Keep it within the current relationship
  - Share it with Ezra Voss (advances RHD chain significantly)
  - Share it with Sable Orin (advances GRL chain if incomplete, affects Sable's arc)
  - Retain it independently for leverage

**Rewards:**
- Maren Solis trust rating increases significantly
- Lore entry unlocked: Solenne Historical Operations — Partial
- Outcome-dependent advances in RHD and GRL chains

**Dependencies:**
- SOL-004 complete

**Story Impact:**
The information Maren shares is a specific and documented piece of Solenne's institutional involvement in Robert Hit Dev's disappearance.
This is the clearest intersection point between the SOL and RHD chains.
Maren is watching what the player does with what she shared — the choice is both a gameplay decision and a relationship test.

---

## SOL-006

**Quest Name:** The Sealed Level

**Starting NPC:** Maren Solis

**Objectives:**
- Learn that the evidence the player needs exists in The Canopy's sealed sub-level
- Work with Maren to gain access — she has the authority but using it creates institutional risk for her
- Enter the sealed level
- Locate and document what is stored there
- Exit without triggering a corporate security escalation

**Rewards:**
- The Canopy sealed level added as accessible location (permanent, conditional)
- Critical evidence package recovered
- Lore entries unlocked: The Sealed Level, Classified Storage — Pre-Division Materials
- Major RHD chain advancement

**Dependencies:**
- SOL-005 complete
- Either: RHD-006 complete OR evidence gathered through other means connecting Solenne to Robert Hit Dev

**Story Impact:**
The sealed level contains materials from the department that no longer officially exists.
What is found here is the most complete institutional record of what happened to Robert Hit Dev from Solenne's perspective.
Maren's decision to authorize access is the first major choice she makes that cannot be explained away within her professional role.
She is now committed to a path whose direction the player's final choice will determine.

---

## SOL-007

**Quest Name:** Maren's Decision

**Starting NPC:** Maren Solis

**Objectives:**
- Meet Maren at a private location outside Solenne's monitored spaces
- Present the complete picture of what the player has uncovered together
- Maren faces her decision about the institution she has served for twenty-five years
- Player's relationship with Maren, built across six prior quests, influences which direction she goes
- Player chooses whether to support her chosen direction, oppose it, or propose a third path

**Rewards:**
- Solenne Political Chain complete
- Outcome-dependent world state changes
- Maren Solis as ongoing contact at maximum or minimum trust depending on alignment
- Access to The Canopy permanently unlocked if outcome is stable

**Dependencies:**
- SOL-006 complete

**Story Impact:**
Maren's decision is one of the game's most significant world-state changes outside the RHD-008 choice.
Three possible outcomes:
- Expose: Maren uses her institutional position to release evidence publicly, accepting personal consequences
- Reform: Maren uses her position to drive internal accountability, the slower and more uncertain path
- Protect: Maren chooses the institution, buries the evidence, and the player's relationship with her ends or continues under fundamentally changed terms
Each outcome creates different conditions in Solenne that affect available content in other chains and in the wider game world.

---

---

# CHAIN: FRG — This Is How We Stay

## Chain Overview

A community-focused chain centered on The Fringe's residents and the daily work of keeping something alive that the world would prefer to neglect.

Does not advance the central mystery directly.

Builds the player's investment in The Fringe as a place with people worth protecting.

The outcomes of this chain shape how The Fringe responds to threats generated by other chains.

Requires BEG chain complete.

---

## FRG-001

**Quest Name:** The Water Problem

**Starting NPC:** No formal assignment — organic trigger from Fringe community awareness

**Objectives:**
- Discover that a water processing relay serving three residential blocks has failed
- Confirm the blocks are not on Solenne's official maintenance register
- Locate repair parts through informal Fringe channels
- Find a resident with technical knowledge to assist with installation
- Coordinate the repair effort
- Confirm restored function

**Rewards:**
- Three residential blocks added as community relationship nodes
- Fringe community reputation increase
- Technical contact added (the resident who assisted)
- First Fringe infrastructure network point established

**Dependencies:**
- BEG-005 complete

**Story Impact:**
Establishes that The Fringe's basic infrastructure is the player's responsibility — not Solenne's.
The three blocks served by this repair become invested in the player's presence.
The technical contact becomes a recurring resource for FRG-004 and FRG-006.

---

## FRG-002

**Quest Name:** The Displaced

**Starting NPC:** A Fringe community elder — informal community spokesperson

**Objectives:**
- Learn that a group has arrived in The Fringe from a destroyed Fractured Zone settlement
- Assess the group's immediate needs
- Negotiate with established Fringe residents to share resources and space
- Navigate community tension about capacity and trust
- Achieve a workable integration outcome — no single correct solution

**Rewards:**
- Displaced group added as community relationship node
- Fringe community reputation increase or decrease depending on negotiation outcome
- New community members provide specific skills that become available in later FRG quests

**Dependencies:**
- FRG-001 complete

**Story Impact:**
Introduces genuine resource scarcity as a community dynamic rather than a player inventory problem.
The integration outcome — how well-received the newcomers are and on what terms — directly affects FRG-006.
Players who achieve a genuinely inclusive outcome unlock additional community support in FRG-006.
Players whose outcome prioritizes established residents over newcomers face a different community composition when the final mission arrives.

---

## FRG-003

**Quest Name:** The Enforcement Problem

**Starting NPC:** Cael (returning character from BEG chain)

**Objectives:**
- Learn from Cael that Solenne's border enforcement has increased in frequency and scope
- Investigate the cause through available Fringe channels
- Trace the enforcement increase to a specific decision made inside Solenne
- Identify a practical Fringe-level response that does not require direct confrontation with Solenne
- Implement the response with community cooperation

**Rewards:**
- Currency (community contribution)
- Fringe community reputation increase
- Intelligence about Solenne border policy unlocked
- Cael's trust rating increases

**Dependencies:**
- FRG-002 complete

**Story Impact:**
The Solenne decision traced in this quest connects to activity in the SOL chain — players running both chains simultaneously gain additional context for what Maren Solis's department actually does.
The practical response implemented here becomes part of The Fringe's resilience infrastructure in FRG-006.
Cael's expanded role in this quest reflects the relationship built during the BEG chain.

---

## FRG-004

**Quest Name:** Something Worth Protecting

**Starting NPC:** Multiple Fringe community members — collaborative trigger

**Objectives:**
- Learn that a shared community resource or space is threatened by an outside property claim
- Identify the nature of the claim and who is making it
- Gather community support for a defense
- Navigate both Fringe informal dispute resolution and the edges of Solenne's formal property system
- Reach a resolution that protects the community resource

**Rewards:**
- Community space permanently added to player's accessible locations
- Fringe community reputation major increase
- Property defense knowledge unlocked as player skill
- Community investment in player as a trusted presence

**Dependencies:**
- FRG-003 complete

**Story Impact:**
The defended community resource becomes a meaningful location in FRG-006 — its survival or loss directly affects the community's ability to coordinate during the final mission.
The outside property claimant has connections that link to either the SOL chain or, in some playthroughs, the GRL chain — depending on player progress.
This is the quest that most clearly establishes what The Fringe is worth fighting for.

---

## FRG-005

**Quest Name:** The Gray Line's Price

**Starting NPC:** Sable Orin (if GRL chain is active) or a Gray Line mid-level contact (if not)

**Objectives:**
- Learn that the Gray Line has increased the cost of a critical supply that The Fringe community depends on
- Negotiate between the community's need and the Gray Line's operational justification
- Find a resolution that does not require choosing one over the other — or accept that a choice must be made
- Report outcome to both parties

**Rewards:**
- Outcome-dependent rewards from each party
- Fringe community and Gray Line relationship states updated simultaneously

**Dependencies:**
- FRG-004 complete
- GRL-001 complete or above (if Sable is the active contact)

**Story Impact:**
Forces the player to navigate conflicting loyalties between The Fringe community and The Gray Line.
Both parties remember who the player prioritized.
If Sable is the active contact, this quest intersects with the GRL chain's tension between Sable's personal goals and Gray Line operational interests.
The resolution method affects the community resources available in FRG-006 and Sable's relationship state going into GRL-007.
The outcome of BEG-005 (the minor dispute between Fringe residents) creates a specific complication in this negotiation for players who made a particular choice there.

---

## FRG-006

**Quest Name:** When They Come

**Starting NPC:** Fringe community — collective trigger based on external threat

**Objectives:**
- Respond to a significant external threat to The Fringe
- The nature of the threat reflects the current state of other quest chains:
  - If SOL-006 or SOL-007 is complete: Solenne enforcement escalation
  - If GRL-007 Path A is chosen: political fallout reaching The Fringe
  - If neither: a Fractured Zone territorial pressure
- Organize The Fringe's available resources and community relationships to respond
- The community's capacity to respond reflects everything built in FRG-001 through FRG-005
- Reach a resolution that preserves The Fringe's operational independence

**Rewards:**
- Fringe Community Quest Chain complete
- Fringe community maximum reputation unlocked
- Player property in The Fringe permanently secured
- Community network established as ongoing support system across the game
- Outcome-dependent impact on wider Fringe stability

**Dependencies:**
- FRG-005 complete

**Story Impact:**
The only mission in Nexus Earth whose structure is determined entirely by player history rather than a binary choice at a decision point.
Communities integrated in FRG-002 contribute specific skills.
Infrastructure repaired in FRG-001 provides functional advantages.
The space defended in FRG-004 serves as a coordination point if it survived.
Contacts built across the chain provide resources and assistance in proportion to how well the player treated them.
Players who completed this chain before the central mystery resolves experience The Fringe's response to that resolution from the inside — with people they know, in a place they helped build.

---

---

## Cross-Chain Dependency Map

```
BEG → GRL
BEG → RHD (+ one other chain partial)
BEG → SOL
BEG → FRG

GRL-005 → unlocks RHD-005 (alternate path)
GRL-007 → affects RHD evidence availability
GRL-007 → affects SOL-005 player options

RHD-006 → advances SOL-006 requirements
RHD-007 → gates RHD-008

SOL-003 → cross-references RHD-004 (same department)
SOL-005 → advances RHD chain if information shared
SOL-006 → provides evidence for RHD-008

FRG-005 → intersects GRL chain (Gray Line contact)
FRG-006 → shaped by SOL-007 and GRL-007 outcomes
BEG-005 → minor complication in FRG-005
```

---

## World State Flags

The following flags are tracked globally and affect NPC dialogue, faction behavior, and available content across all chains.

| Flag ID | Trigger | Effect |
|---|---|---|
| FLAG-RHD-KNOWN | RHD-007 complete | NPCs across Nexus Earth react to the player as someone who knows |
| FLAG-GRLREC-FOUND | GRL-007 complete | Gray Line internal history known; Sable's arc continues |
| FLAG-SOL-EXPOSED | SOL-007 Expose outcome | Solenne Integrated Systems faces public pressure; power shift begins |
| FLAG-SOL-REFORM | SOL-007 Reform outcome | Maren Solis leads internal accountability process |
| FLAG-SOL-PROTECT | SOL-007 Protect outcome | Status quo maintained; player loses or retains Maren based on alignment |
| FLAG-FRG-BUILT | FRG-006 complete | Fringe community established as resilient; player has permanent presence |
| FLAG-MANIFESTO-COMPLETE | RHD-003 complete | Complete Manifesto in circulation; faction reactions triggered |
| FLAG-RHD-RELEASED | RHD-008 Path A | Truth public; world-state shift begins |
| FLAG-RHD-LEVERAGE | RHD-008 Path B | Player and allies hold private leverage over Solenne |
| FLAG-RHD-CONTAINED | RHD-008 Path C | Controlled release managed by Maren; gradual change |
| FLAG-RHD-PROTECTED | RHD-008 Path D | Truth secured; no immediate world change; late-game content preserved |

---

## Development Notes

This document covers the five approved quest chains for Phase 1 narrative content.

Future documents will define:

- Individual mission scripts and dialogue
- NPC schedule integration
- Reputation threshold values
- Item and reward specifications
- Additional side quests
- Late-game content unlocked by world state flags
- Quest chains for Calvara and Dura Mak (pending city approval)
- Fractured Zone quest content (pending settlement development)

All future quest content must follow the ID format, dependency structure, and world state flag system defined in this document.
