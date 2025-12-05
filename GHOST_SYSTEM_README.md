# Ghost System Documentation & Refactoring Index

## 📚 Complete Reference for Ghost Objects and Refactoring

This document is your entry point to understanding and working with the Pacman Ghost system.

---

## 🚀 Quick Start

### For Reading the Code
1. Start here: **[GHOST_REFACTORING_GUIDE.md](GHOST_REFACTORING_GUIDE.md)** - Quick reference with examples
2. Read: **[scripts/GHOST_STATE/GHOST_STATE.gml](scripts/GHOST_STATE/GHOST_STATE.gml)** - State machine enum
3. Read: **[scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml](scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml)** - Direction system
4. Read: **[scripts/ghost_colors/ghost_colors.gml](scripts/ghost_colors/ghost_colors.gml)** - Color system

### For Understanding the Refactoring
1. Read: **[REFACTORING_SUMMARY.md](REFACTORING_SUMMARY.md)** - Phase 1 completion and next steps
2. Read: **[GHOST_REFACTORING_PLAN.md](GHOST_REFACTORING_PLAN.md)** - Detailed strategic planning

### For Implementing Phase 2
1. Follow: **[GHOST_REFACTORING_PLAN.md](GHOST_REFACTORING_PLAN.md)** - Implementation roadmap
2. Check: **[GHOST_REFACTORING_GUIDE.md](GHOST_REFACTORING_GUIDE.md)** - Code examples

---

## 📖 Documentation Structure

### Strategic Documents (Long-form Planning)

| Document | Purpose | Read When |
|----------|---------|-----------|
| **[GHOST_REFACTORING_PLAN.md](GHOST_REFACTORING_PLAN.md)** | Comprehensive refactoring strategy (200+ lines) | Understanding the full vision & architecture |
| **[REFACTORING_SUMMARY.md](REFACTORING_SUMMARY.md)** | Phase 1 completion & next steps | Planning Phase 2 implementation |
| **[GHOST_REFACTORING_GUIDE.md](GHOST_REFACTORING_GUIDE.md)** | Quick reference & code examples | Fast lookup while coding |

### Code Files (Enums & Systems)

| File | Purpose | Contains |
|------|---------|----------|
| **[scripts/GHOST_STATE/GHOST_STATE.gml](scripts/GHOST_STATE/GHOST_STATE.gml)** | State machine enum | GHOST_STATE enum + 5 states + state_name helper |
| **[scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml](scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml)** | Direction enum | GHOST_DIRECTION enum + 5 helper functions |
| **[scripts/ghost_colors/ghost_colors.gml](scripts/ghost_colors/ghost_colors.gml)** | Color system | Ghost colors + state colors + rendering helpers |

### Ghost Objects (To Be Refactored)

| Object | Type | Location |
|--------|------|----------|
| **Blinky** | Ghost (Red - Pursuer) | `/objects/Blinky/` |
| **Pinky** | Ghost (Pink - Ambusher) | `/objects/Pinky/` |
| **Inky** | Ghost (Cyan - Tricky) | `/objects/Inky/` |
| **Clyde** | Ghost (Orange - Bashful) | `/objects/Clyde/` |
| **oGhost** | Base Ghost (Pending) | `/objects/oGhost/` (to be created) |

---

## 🎮 Ghost Behaviors & Personalities

### Blinky (Red Ghost - Shadow)
- **Personality:** Aggressive direct pursuer
- **Behavior:** Chases Pac's current position
- **Scatter Corner:** Top-left (32, 32)
- **Special:** Enters Elroy (faster) mode when dots are low
- **Location:** `/objects/Blinky/`

### Pinky (Pink Ghost - Speedy)
- **Personality:** Ambusher/planner
- **Behavior:** Targets 4 tiles ahead of Pac (anticipation)
- **Scatter Corner:** Top-right (416, 32)
- **Special:** House exit uses dot counting logic
- **Location:** `/objects/Pinky/`

### Inky (Cyan Ghost - Bashful)
- **Personality:** Unpredictable/tricky
- **Behavior:** Uses Blinky's position as reference point
- **Scatter Corner:** Bottom-right (416, 416)
- **Special:** Complex house exit pattern (housestate 0-4)
- **Location:** `/objects/Inky/`

### Clyde (Orange Ghost - Pokey)
- **Personality:** Cowardly/impulsive
- **Behavior:** Chases if far (>128px), flees if close
- **Scatter Corner:** Bottom-left (32, 416)
- **Special:** Distance-based behavior change
- **Location:** `/objects/Clyde/`

---

## 🔧 State Machine Guide

### Ghost States (GHOST_STATE enum)

```
CHASE (0)
├─ Normal pursuit mode
├─ Behavior: Chase Pac or move to scatter corner
├─ Speed: Normal (varies by level)
└─ Animation: Normal sprite

FRIGHTENED (1)
├─ Power pellet active
├─ Behavior: Random movement
├─ Speed: Reduced (1.25 tiles/frame)
└─ Animation: Blue with flashing

EYES (2)
├─ Ghost eaten
├─ Behavior: Return to house entrance
├─ Speed: Fast (4.0 tiles/frame)
└─ Animation: Eyes only

IN_HOUSE (3)
├─ Exiting ghost house
├─ Behavior: Complex bouncing pattern
├─ Speed: Variable (house logic)
└─ Animation: Normal sprite

HOUSE_READY (4)
├─ Waiting in house
├─ Behavior: Stationary
├─ Speed: 0
└─ Animation: Normal sprite
```

### Direction System (GHOST_DIRECTION enum)

```
RIGHT (0)  ──→ Movement: +X (east)
UP (1)     ──↑ Movement: -Y (north)
LEFT (2)   ←── Movement: -X (west)
DOWN (3)   ──↓ Movement: +Y (south)
```

### Color System

```
Chase Colors (Primary)
├─ Blinky: Red (255, 0, 0)
├─ Pinky: Pink (255, 184, 255)
├─ Inky: Cyan (0, 255, 255)
└─ Clyde: Orange (255, 184, 82)

State Colors
├─ Frightened: Dark Blue (33, 33, 222)
├─ Frightened Flash: White (255, 255, 255)
└─ Eyes: White (255, 255, 255)
```

---

## 💡 Key Enums & Functions Reference

### State Management
```gml
// Check ghost state
if state == GHOST_STATE.CHASE { ... }
if state == GHOST_STATE.FRIGHTENED { ... }

// Get state name for debugging
debug_msg = ghost_state_name(state);  // Returns "CHASE", "FRIGHTENED", etc.
```

### Direction Management
```gml
// Use cardinal directions (0-3)
if dir == GHOST_DIRECTION.RIGHT { ... }
if dir == GHOST_DIRECTION.UP { ... }

// Convert between formats
degree_val = direction_from_cardinal(GHOST_DIRECTION.UP);  // Returns 90
cardinal = cardinal_from_direction(90);  // Returns 1

// Get direction name
dir_name = direction_name(GHOST_DIRECTION.UP);  // Returns "UP"

// Get opposite direction
opposite = direction_opposite(GHOST_DIRECTION.UP);  // Returns DOWN

// Get movement vector
vec = direction_to_vector(GHOST_DIRECTION.RIGHT);  // Returns {dx: 1, dy: 0}
```

### Color Management
```gml
// Get ghost color by name
color = ghost_get_color("Blinky");  // Returns red

// Get ghost color by object
color = ghost_get_color_by_object(Blinky);

// Get state-specific colors
color = ghost_color_frightened();  // Dark blue
color = ghost_color_frightened_flash();  // White (flashing)
color = ghost_color_eyes();  // White

// Draw ghost with state-aware coloring
draw_ghost_sprite(sprite, frame, x, y, state, color, flash);
```

---

## 📋 Phase Status

### ✅ Phase 1: Enum System & Documentation (COMPLETE)
- [x] GHOST_STATE enum created
- [x] GHOST_DIRECTION enum created
- [x] Ghost color system created
- [x] Comprehensive planning documentation
- [x] Quick reference guide
- [x] Extensive inline comments

### ⏳ Phase 2: Base Object & Inheritance (READY TO START)
- [ ] Create oGhost base object
- [ ] Extract common logic into oGhost
- [ ] Refactor all 4 ghosts to inherit from oGhost
- [ ] Add extensive comments to ghost objects
- [ ] Test all behaviors

### 🔲 Phase 3: Helper Functions (FUTURE)
- [ ] Extract pathfinding logic
- [ ] Create house exit state machine
- [ ] Refactor chase_object() script

### 🔲 Phase 4: Advanced Features (FUTURE)
- [ ] Ghost formations
- [ ] Debug visualization
- [ ] AI behavior tweaking
- [ ] Performance optimization

---

## 🎯 Implementation Checklist

### Before Starting Phase 2
- [ ] Read GHOST_REFACTORING_PLAN.md
- [ ] Review GHOST_STATE enum and functions
- [ ] Review GHOST_DIRECTION enum and functions
- [ ] Review ghost_colors functions
- [ ] Understand the inheritance structure

### Phase 2 Task List
- [ ] Create oGhost object in editor
- [ ] Copy Blinky's Create_0.gml to oGhost/Create_0.gml
- [ ] Create oGhost/Step_0.gml (animation updates)
- [ ] Copy Blinky's Step_1.gml to oGhost/Step_1.gml
- [ ] Copy Blinky's Step_2.gml to oGhost/Step_2.gml
- [ ] Copy Blinky's Draw_0.gml to oGhost/Draw_0.gml
- [ ] Copy other events to oGhost (Alarm_0, Other_0, Other_4)
- [ ] Update Blinky to call event_inherited() and override only unique code
- [ ] Update Pinky similarly
- [ ] Update Inky similarly
- [ ] Update Clyde similarly
- [ ] Add extensive comments throughout
- [ ] Test all ghost behaviors
- [ ] Verify backward compatibility

---

## 🔍 Finding Things

### How to Find...

**Ghost object code**
→ `/objects/Blinky/`, `/objects/Pinky/`, `/objects/Inky/`, `/objects/Clyde/`

**State definitions**
→ `/scripts/GHOST_STATE/GHOST_STATE.gml`

**Direction helpers**
→ `/scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml`

**Color definitions**
→ `/scripts/ghost_colors/ghost_colors.gml`

**Refactoring strategy**
→ `GHOST_REFACTORING_PLAN.md`

**Quick reference**
→ `GHOST_REFACTORING_GUIDE.md`

**Phase status**
→ `REFACTORING_SUMMARY.md`

**This index**
→ `GHOST_SYSTEM_README.md` (this file)

---

## 📖 Reading Order for Different Audiences

### For Designers/Game Programmers
1. Read: GHOST_REFACTORING_GUIDE.md (understand the system)
2. Read: Individual ghost object descriptions above
3. Reference: GHOST_REFACTORING_PLAN.md (understand full vision)

### For Developers Implementing Phase 2
1. Read: GHOST_REFACTORING_PLAN.md (understand strategy)
2. Study: GHOST_STATE, GHOST_DIRECTION, ghost_colors files
3. Follow: Implementation roadmap in GHOST_REFACTORING_PLAN.md
4. Reference: GHOST_REFACTORING_GUIDE.md (code examples)

### For Developers Maintaining the Code
1. Quick reference: GHOST_REFACTORING_GUIDE.md
2. Code lookup: scripts/GHOST_*.gml files
3. Deep dive: Specific object files in /objects/Ghost*/

### For New Developers Learning the System
1. Start: This README (understanding overview)
2. Read: GHOST_REFACTORING_GUIDE.md (learn the system)
3. Study: scripts/GHOST_STATE.gml and GHOST_DIRECTION.gml
4. Deep dive: Ghost object files
5. Reference: GHOST_REFACTORING_PLAN.md (full context)

---

## ✨ Key Features of This Refactoring

### Code Clarity
✅ Named enum values instead of magic numbers
✅ Self-documenting code
✅ Helper functions for common operations
✅ Conversion functions between coordinate systems

### Documentation
✅ 200+ lines of planning documentation
✅ Extensive inline code comments
✅ Code examples with before/after
✅ Architecture diagrams
✅ This comprehensive README

### Maintainability
✅ Single source of truth for behaviors
✅ Centralized color management
✅ Centralized state definitions
✅ Helper functions reduce code complexity

### Extensibility
✅ Easy to add new ghost variants
✅ Easy to add new states
✅ Easy to modify behaviors
✅ Easy to change colors/theming

### Backward Compatibility
✅ Enum values match original numbers
✅ All variable names unchanged
✅ All behaviors identical
✅ No gameplay changes

---

## 🤝 Contributing

When adding new ghost code:
1. Use GHOST_STATE enum instead of numeric values
2. Use GHOST_DIRECTION enum instead of numeric values
3. Use ghost_color_*() functions instead of hardcoded RGB
4. Add extensive comments explaining logic
5. Follow existing code style
6. Update this README if adding new features

---

## 📞 Questions?

- **"How do I check ghost state?"** → See GHOST_STATE enum section
- **"How do I move a ghost?"** → See GHOST_DIRECTION enum + direction_to_vector()
- **"How do I change ghost colors?"** → See ghost_colors functions
- **"What's the refactoring strategy?"** → See GHOST_REFACTORING_PLAN.md
- **"How do I implement inheritance?"** → See GHOST_REFACTORING_GUIDE.md
- **"Where's the base object going?"** → `/objects/oGhost/` (Phase 2)

---

## 🎓 Summary

This refactoring transforms the Ghost system from:
- ❌ 95% duplicated copy-pasted code
- ❌ Magic numbers throughout
- ❌ Hardcoded colors
- ❌ Undocumented behavior

Into:
- ✅ DRY principle with shared base object
- ✅ Named enum values for clarity
- ✅ Centralized color management
- ✅ Extensive documentation
- ✅ Easier to extend and maintain

**Status:** Phase 1 Complete ✅ | Phase 2 Ready to Start ⏳

---

*Last Updated: December 5, 2025*
*Refactoring Status: Phase 1 Complete - Enum System & Documentation*
*Next: Phase 2 - Base Object Creation & Ghost Inheritance*
