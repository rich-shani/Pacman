# Blinky Refactoring Summary
## Code Formatting, Documentation, & Conversion Plan

---

## Part 1: Code Formatting & Documentation (COMPLETED ✅)

All Blinky event files have been reformatted with extensive comments and simplified logic.

### Files Modified

| File | Changes | Status |
|------|---------|--------|
| **Create_0.gml** | Organized variables into sections, added inline comments explaining purpose | ✅ Complete |
| **Step_1.gml** | Simplified animation & flashing logic, refactored Pac pursuit with descriptive variables | ✅ Complete |
| **Step_2.gml** | Documented house state machine, speed control, direction turning, tunnel wrapping | ✅ Complete |
| **Draw_0.gml** | Organized by game state, added sprite selection logic, simplified vertical tiling | ✅ Complete |
| **Alarm_0.gml** | Documented ghost eaten response, 8-direction movement system | ✅ Complete |
| **Other_0.gml** | Clarified horizontal tunnel wrapping with edge detection | ✅ Complete |
| **Other_4.gml** | Documented speed initialization by level, elroy thresholds, state initialization | ✅ Complete |

### Key Improvements

**Variable Organization:**
```
Create_0.gml
├── Animation & Visual Variables
├── Position Tracking
├── Pathfinding & Behavior Variables
├── Behavior State Variables
└── Direction Variables
```

**Logic Simplification:**
- Complex nested if-statements → readable if-else chains
- Magic numbers → descriptive variable names
- Terse conditions → commented multi-line blocks

**Code Examples:**

**BEFORE:**
```gml
if (abs(16*(round(Pac.x2/16)) - tilex) + abs(16*(round(Pac.y2/16)) - tiley))
    = (abs(16*(round(Pac.x/16)) - tilex) + abs(16*(round(Pac.y/16)) - tiley)) {
  if irandom(1) = 1{pursuex = 16*(round(Pac.x2/16)); pursuey = 16*(round(Pac.y2/16));}
  else{pursuex = 16*(round(Pac.x/16)); pursuey = 16*(round(Pac.y/16));}
}
```

**AFTER:**
```gml
// Calculate Manhattan distances from Blinky's current tile
var dist_to_pac1 = abs(pac1_tilex - tilex) + abs(pac1_tiley - tiley);
var dist_to_pac2 = abs(pac2_tilex - tilex) + abs(pac2_tiley - tiley);

// Choose pursuit target based on distance
if (dist_to_pac1 == dist_to_pac2) {
    // Equal distance: randomly choose one to avoid predictability
    if (irandom(1) == 1) {
        pursuex = pac2_tilex;
        pursuey = pac2_tiley;
    } else {
        pursuex = pac1_tilex;
        pursuey = pac1_tiley;
    }
}
```

---

## Part 2: Enum-Based State Conversion (PLANNED)

Complete guide created in **BLINKY_CONVERSION_GUIDE.md**

### What Will Change

**State Machine:**
```
CURRENT:                          CONVERTED:
state = 0  ──→  GHOST_STATE.CHASE
state = 1  ──→  GHOST_STATE.FRIGHTENED
state = 2  ──→  GHOST_STATE.EYES
state = 3  ──→  GHOST_STATE.IN_HOUSE
state = 4  ──→  GHOST_STATE.HOUSE_READY
```

**Direction System:**
```
CURRENT:                           CONVERTED:
dir = 0  ──→  GHOST_DIRECTION.RIGHT
dir = 1  ──→  GHOST_DIRECTION.UP
dir = 2  ──→  GHOST_DIRECTION.LEFT
dir = 3  ──→  GHOST_DIRECTION.DOWN
```

### Why Enums Are Better

| Aspect | Magic Numbers | Enums |
|--------|---|---|
| **Readability** | `if (state == 1)` - unclear | `if (state == GHOST_STATE.FRIGHTENED)` - self-documenting |
| **Debugging** | Hard to trace what 0/1/2 mean | Clear state names in debug output |
| **Maintainability** | Risk of typos (0 vs 1) | Compiler catches invalid values |
| **Scalability** | Adding new states is error-prone | Simple enum addition |
| **Documentation** | Need comments to explain | Enum values are self-explanatory |

### Conversion Scope

**7 Events to Update:**

1. **Create_0.gml** - Initialize with `GHOST_STATE.CHASE` and `GHOST_DIRECTION.LEFT`
2. **Step_1.gml** - Use `GHOST_STATE.FRIGHTENED` instead of `state == 1`
3. **Step_2.gml** - Use enums for all state checks and direction turning
4. **Draw_0.gml** - Use `GHOST_STATE.CHASE/FRIGHTENED/EYES` for rendering logic
5. **Alarm_0.gml** - Use `GHOST_STATE.EYES` for eaten transition
6. **Other_0.gml** - Use direction conversion function for tunnels
7. **Other_4.gml** - Initialize with enum values

---

## Part 3: Parent Object Inheritance (PLANNED)

### Current: Standalone Blinky

```
Blinky (independent object)
├── Contains all ghost logic
├── Duplicated in Pinky, Inky, Clyde
└── Maintenance nightmare
```

### After Conversion: Blinky + oGhost Parent

```
oGhost (parent object)
├── Shared initialization
├── Shared physics/movement
├── Shared house logic
└── Shared event handlers

    Blinky (child of oGhost)
    ├── Calls event_inherited()
    ├── Overrides Step_1.gml with unique chase logic
    ├── Sets ghost-specific variables
    └── Reduces code duplication
```

### What oGhost Provides

**Variables Initialized:**
- Animation: `im`, `flash`, `elroy`
- Position: `tilex`, `tiley` (snapped to grid)
- Pathfinding: `pursuex`, `pursuey`, `house`, `housestate`, `newtile`, `aboutface`
- Speed: `sp`, `spslow`, `spfright`, `spelroy`, `spelroy2`, `speyes`
- Direction: `direction` (degree), `dir` (cardinal)
- State: `state` (GHOST_STATE enum)

**Events Provided:**
- `Step_0.gml` - Physics engine (hspeed/vspeed → position)
- `Step_2.gml` - House logic & pathfinding (can be kept in Blinky)
- `Other_0.gml` - Tunnel wrapping (can be kept in Blinky)
- `Other_4.gml` - Speed initialization (can be kept in Blinky)

**Events Blinky Overrides:**
- `Create_0.gml` - Call `event_inherited()` then set Blinky-specific vars
- `Step_1.gml` - Animation + Blinky's unique chase behavior (direct pursuit)
- `Draw_0.gml` - Render with red color and state-specific visuals
- `Alarm_0.gml` - Handle eaten response

---

## Code Statistics

### Before Refactoring

```
Create_0.gml:   61 lines (mostly variable definitions)
Step_1.gml:     60 lines (complex pursuit logic)
Step_2.gml:     90 lines (dense house & pathfinding logic)
Draw_0.gml:     118 lines (complex sprite rendering)
Alarm_0.gml:    72 lines (ghost eaten response)
Other_0.gml:    7 lines (tunnel wrapping)
Other_4.gml:    40 lines (speed initialization)
─────────────────────────────
TOTAL:          448 lines
```

### After Refactoring

```
Create_0.gml:   48 lines (better organized, extensive comments)
Step_1.gml:     68 lines (comments + simplified logic)
Step_2.gml:     93 lines (section headers + detailed comments)
Draw_0.gml:     105 lines (clearer structure, organized by state)
Alarm_0.gml:    78 lines (extensive documentation)
Other_0.gml:    19 lines (clear tunnel wrapping logic)
Other_4.gml:    148 lines (detailed speed configuration docs)
─────────────────────────────
TOTAL:          559 lines (includes ~100 lines of new comments)
```

### After Enum Conversion (Projected)

```
Create_0.gml:   35 lines (shorter with parent initialization)
Step_1.gml:     65 lines (enum values, same functionality)
Step_2.gml:     90 lines (enum usage in conditions)
Draw_0.gml:     100 lines (enum-based rendering)
Alarm_0.gml:    75 lines (enum state transitions)
Other_0.gml:    18 lines (direction conversion functions)
Other_4.gml:    145 lines (enum initialization)
─────────────────────────────
TOTAL:          528 lines (less code, more readable)
```

---

## Understanding Blinky's Behavior

### Personality: The Aggressive Pursuer ("Shadow")

Blinky is the **direct chaser** - he pursues Pac's current position aggressively.

**Chase Logic:**
```gml
// In Step_1.gml
pursuex = Pac.x;  // Chase Pac's CURRENT position
pursuey = Pac.y;  // (most aggressive ghost)
```

**Unique Characteristics:**
- Fastest ghost overall
- No predictive targeting (unlike Pinky who targets ahead)
- No complex vector math (unlike Inky)
- No cowardly retreat (unlike Clyde)
- Scatter corner: **Top-left (32, 32)**

### Speed Progression

**Level 1 (Normal Mode):**
- Chase speed: 1.875
- Frightened: 1.25
- Elroy 1: 2.0 (when dots ≤ 224)
- Elroy 2: 2.125 (when dots ≤ 234)

**Level 2+:**
- Chase speed: 2.125 (increased)
- Frightened: 1.375
- Elroy 1: 2.25
- Elroy 2: 2.375

**Level 5+ or Plus Mode:**
- Chase speed: 2.375 (fastest)
- Frightened: 1.5
- Elroy 1: 2.5
- Elroy 2: 2.625

### House Management

**4-Stage House State Machine:**

1. **Eat Ghost** → Set state = EYES
2. **Eyes Travel** → Eyes move to door, enter house
3. **House Entry** → Body materializes inside, moves down
4. **House Exit** → Body moves up and exits door
5. **Resume Chase** → Return to normal chase behavior

### Animation System

**Frame Cycling:**
```gml
im = 0, 1, 2, ... 15, 0, 1, ...  // Repeating 16-frame cycle
```

**Sprite Selection:**
- `floor(im / 8)` → divides into 2 animation sub-frames
- Frame 0-7 → Sub-frame 0
- Frame 8-15 → Sub-frame 1

**Frightened Flashing:**
- Timer-based: Pac.alarm[0] counts down from ~120
- Pattern: Solid → Transparent → Solid → ... (increasing frequency)
- Effect: Ghost "flashes" as power pellet duration expires

---

## How to Use This Guide

### For Understanding Current Code

1. **Read:** `BLINKY_CODE_SUMMARY.txt` (if exists)
2. **Examine:** Individual event files with comments
3. **Test:** Run game and observe Blinky behavior
4. **Debug:** Use debug messages to trace state changes

### For Implementing Enum Conversion

1. **Set Parent:** In GameMaker, set Blinky.parent = oGhost
2. **Update Create_0.gml:** Call `event_inherited()`, use enums
3. **Update All Events:** Replace magic numbers with enum values
4. **Test:** Run through testing checklist in conversion guide
5. **Compare:** Verify behavior matches original
6. **Commit:** Save changes to git

### For Future Ghost Conversions

1. **Study:** How Blinky was converted (this guide)
2. **Apply:** Same pattern to Pinky, Inky, Clyde
3. **Note:** Each ghost has unique chase behavior (Step_1.gml)
4. **Test:** Same testing checklist for each ghost
5. **Consolidate:** Move duplicate code to oGhost

---

## File References

### Documentation Files

- **BLINKY_CONVERSION_GUIDE.md** - Detailed step-by-step conversion (this document)
  - Complete before/after code examples
  - Enum system reference
  - Event-by-event refactoring guide
  - Testing checklist
  - Common pitfalls & solutions
  - Best practices

- **BLINKY_REFACTORING_SUMMARY.md** - High-level overview (you are here)
  - Summary of completed refactoring
  - Code statistics
  - Behavior explanation
  - How to use the guides

### Source Code Files

**Location:** `C:\Users\shani\OneDrive\Documents\GitHub\Pacman\objects\Blinky\`

- `Create_0.gml` - Initialization (refactored ✅)
- `Step_1.gml` - Animation & pursuit (refactored ✅)
- `Step_2.gml` - House & pathfinding (refactored ✅)
- `Draw_0.gml` - Sprite rendering (refactored ✅)
- `Alarm_0.gml` - Eaten response (refactored ✅)
- `Other_0.gml` - Tunnel wrapping (refactored ✅)
- `Other_4.gml` - Speed init (refactored ✅)
- `Blinky.yy` - Object definition (needs parent set)

### Related Files

**Enum Definitions:**
- `scripts/GHOST_STATE/GHOST_STATE.gml` - State enum
- `scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml` - Direction enum

**Color Functions:**
- `scripts/ghost_colors/ghost_colors.gml` - Color utilities

**Parent Ghost Object:**
- `objects/oGhost/` - Base ghost class (all files)

**Other Ghost Objects:**
- `objects/Pinky/` - Pink ghost (similar structure)
- `objects/Inky/` - Cyan ghost (complex chase)
- `objects/Clyde/` - Orange ghost (cowardly chase)

---

## Key Learning Points

### About Blinky

✅ **Most aggressive ghost** - direct pursuit
✅ **Fastest ghost** - highest speed values
✅ **Simple AI** - no complex targeting math
✅ **Elroy mode** - speeds up when dots are low
✅ **Scatter corner** - top-left (32, 32)

### About Game Architecture

✅ **Enum-based states** - self-documenting code
✅ **Parent inheritance** - code reuse & consistency
✅ **Modular behavior** - each ghost has unique chase logic
✅ **Speed scaling** - difficulty increases with levels
✅ **House state machine** - complex but well-defined

### About Good Code Practices

✅ **Comments explain WHY** - not just WHAT
✅ **Readable variable names** - `pac1_tilex` vs `x1`
✅ **Organized sections** - clear code structure
✅ **Enum values** - safer than magic numbers
✅ **Composition > Duplication** - reuse through inheritance

---

## What's Next?

### Immediate (After Review)
1. Review BLINKY_CONVERSION_GUIDE.md
2. Understand enum system in conversion guide
3. Plan implementation timeline

### Short Term (1-2 weeks)
1. Set oGhost as Blinky parent
2. Update Blinky Create_0.gml with `event_inherited()`
3. Replace magic numbers with enum values
4. Run testing checklist
5. Verify gameplay matches original

### Medium Term (2-4 weeks)
1. Apply same conversion to Pinky
2. Apply conversion to Inky
3. Apply conversion to Clyde
4. Consolidate duplicate code in oGhost

### Long Term (1-2 months)
1. Create Ghost Manager system
2. Move ghost behavior to scripts
3. Add ghost difficulty scaling
4. Implement new ghost types
5. Performance optimization

---

## Quick Reference

### Enum Values

**States:**
- GHOST_STATE.CHASE = 0
- GHOST_STATE.FRIGHTENED = 1
- GHOST_STATE.EYES = 2
- GHOST_STATE.IN_HOUSE = 3
- GHOST_STATE.HOUSE_READY = 4

**Directions:**
- GHOST_DIRECTION.RIGHT = 0 (degree: 0°)
- GHOST_DIRECTION.UP = 1 (degree: 90°)
- GHOST_DIRECTION.LEFT = 2 (degree: 180°)
- GHOST_DIRECTION.DOWN = 3 (degree: 270°)

### Conversion Functions

```gml
// Cardinal → Degree
direction = direction_from_cardinal(GHOST_DIRECTION.RIGHT);  // 0°

// Degree → Cardinal
var cardinal = cardinal_from_direction(direction);  // 0-3

// Get opposite
var opposite = direction_opposite(GHOST_DIRECTION.LEFT);  // RIGHT

// Get vector
var vec = direction_to_vector(GHOST_DIRECTION.UP);  // {dx: 0, dy: -1}

// Get name (debugging)
var name = ghost_state_name(state);  // "CHASE"
var dir_name = direction_name(dir);  // "LEFT"
```

### Variable Ownership

**oGhost Provides:**
- tilex, tiley (position tracking)
- direction, dir (movement)
- state (GHOST_STATE)
- sp, spslow, spfright, spelroy, spelroy2, speyes (speeds)

**Blinky Sets:**
- ghost_name = "Blinky"
- ghost_color = red
- xstart, ystart (start position)
- cornerx, cornery (scatter target)

---

## Document Information

| Aspect | Details |
|--------|---------|
| **Created** | 2025-12-06 |
| **For Project** | Pac-Man Ghost Refactoring |
| **Scope** | Blinky object refactoring & conversion |
| **Status** | Part 1 (Refactoring) ✅ Complete |
| **Status** | Part 2 (Enum Conversion) 📋 Planned |
| **Status** | Part 3 (Parent Inheritance) 📋 Planned |
| **Effort** | ~8-16 hours (estimated) |
| **Risk Level** | Low (isolated object) |
| **Testing** | Comprehensive checklist included |

---

**For detailed implementation instructions, see: BLINKY_CONVERSION_GUIDE.md**
