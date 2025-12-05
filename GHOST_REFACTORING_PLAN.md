# Ghost Object Refactoring Plan

## Overview

This document outlines a comprehensive refactoring of the Ghost system to:
1. **Eliminate code duplication** - Create a base `oGhost` parent object
2. **Implement enum-based state machine** - Replace numeric state values with named constants
3. **Add extensive comments** - Document all variables and logic
4. **Improve maintainability** - Use structs for ghost personality traits
5. **Preserve functionality** - Maintain exact game behavior during refactoring

---

## Current Architecture Issues

### 1. Massive Code Duplication (95%)
- **Blinky, Pinky, Inky, Clyde** have nearly identical code
- Each ghost duplicates:
  - Create_0.gml (initialization)
  - Step_1.gml (target calculation)
  - Step_2.gml (movement logic ~280 lines)
  - Draw_0.gml (sprite rendering)
  - Alarm_0.gml (frightened response)
  - Other_0.gml (wraparound)
  - Other_4.gml (speed initialization)

### 2. Inconsistent State Management
- States encoded as numbers (0, 1, 2)
- House states vary by ghost (0-2 for Blinky, 0-4 for Inky/Clyde)
- No clear documentation of state meanings
- Magic numbers scattered throughout code

### 3. Ghost Personality Hardcoded
- Scatter corners buried in Create event
- Chase behavior baked into Step_1
- Target calculation methods scattered
- Difficult to add new ghost behaviors

### 4. Complex Pathfinding Logic
- `chase_object()` script is 400+ lines
- Deeply nested if-else chains
- No helper functions for direction checking
- Difficult to debug or modify

---

## Proposed Solution: Enum-Based State Machine + Base Object

### PHASE 1: Create Enum System

#### 1.1 Create `GHOST_STATE` Enum
**File:** `scripts/GHOST_STATE/GHOST_STATE.gml`

```gml
enum GHOST_STATE {
    CHASE = 0,        // Normal pursuit mode - ghost chases Pac or scatter corner
    FRIGHTENED = 1,   // Power pellet active - ghost flees randomly
    EYES = 2,         // Dead state - eyes return to ghost house
    IN_HOUSE = 3,     // Exiting ghost house - complex bouncing logic
    HOUSE_READY = 4   // Waiting in house for release condition
}
```

**Benefits:**
- Code reads as `if state == GHOST_STATE.CHASE` instead of `if state == 0`
- State changes are self-documenting
- Reduces bugs from numeric state confusion

#### 1.2 Create `GHOST_DIRECTION` Enum
**File:** `scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml`

```gml
enum GHOST_DIRECTION {
    RIGHT = 0,
    UP = 1,
    LEFT = 2,
    DOWN = 3
}
```

#### 1.3 Create Color Constants
**File:** `scripts/ghost_colors/ghost_colors.gml`

```gml
function ghost_color_blinky() { return make_color_rgb(255, 0, 0); }     // Red
function ghost_color_pinky() { return make_color_rgb(255, 184, 255); }  // Pink
function ghost_color_inky() { return make_color_rgb(0, 255, 255); }     // Cyan
function ghost_color_clyde() { return make_color_rgb(255, 184, 82); }   // Orange
```

---

### PHASE 2: Create Base Ghost Object

#### 2.1 Create `oGhost` Parent Object
**File:** `objects/oGhost/Create_0.gml`

Contains all shared initialization:
- Animation variables
- Position tracking
- State machine variables
- Direction tracking
- Default values

**Key Variables:**
```gml
// === IDENTIFICATION ===
ghost_name = "";           // "Blinky", "Pinky", "Inky", "Clyde"
ghost_personality = {};    // Struct with personality traits

// === ANIMATION ===
im = 0;                    // Animation frame index (0-15)
flash = 0;                 // Flashing counter for frightened mode

// === POSITION ===
tilex = 0;                 // Grid X (16-pixel tiles)
tiley = 0;                 // Grid Y (16-pixel tiles)
xstart = 0;                // Starting X position (set by child)
ystart = 0;                // Starting Y position (set by child)

// === AI STATE ===
state = GHOST_STATE.CHASE; // Current behavioral state
pursuex = 0;               // Target X for chase behavior
pursuey = 0;               // Target Y for chase behavior

// === MOVEMENT ===
direction = 0;             // Degrees: 0=right, 90=up, 180=left, 270=down
dir = GHOST_DIRECTION.RIGHT; // Cardinal: 0-3
newtile = 0;               // Flag: reached new tile
aboutface = 0;             // Flag: reverse direction for power pellet

// === HOUSE ===
house = 0;                 // 0=released, 1=in house
housestate = 0;            // Substates for house exiting (varies by ghost)

// === SCATTER BEHAVIOR ===
cornerx = 0;               // Scatter corner X (set by child)
cornery = 0;               // Scatter corner Y (set by child)

// === ELROY MODE (Fast Pursuit) ===
elroydots = 244;           // Dot threshold for Elroy mode 1
elroydots2 = 0;            // Dot threshold for Elroy mode 2
```

#### 2.2 `oGhost` Step_0 Event
**New event** - Handles common state updates:
```gml
// Animation updates
if state != GHOST_STATE.EYES {
    im = (im + 1) % 16;    // Cycle animation frames 0-15
}

// Frightened mode flashing
if state == GHOST_STATE.FRIGHTENED {
    flash = (flash + 1) % 30;
}

// Update tile tracking
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);
```

#### 2.3 `oGhost` Step_1 Event
**File:** `objects/oGhost/Step_1.gml`

Calculates target based on state, **to be overridden by children**:
```gml
if state == GHOST_STATE.CHASE {
    // Call virtual method - each ghost implements differently
    calculate_target();
}
else if state == GHOST_STATE.FRIGHTENED {
    // Use random_direction script
    script_execute(random_direction);
}
else if state == GHOST_STATE.EYES {
    // Chase ghost house entrance
    pursuex = 216; // Ghost house center
    pursuey = 240;
}
```

#### 2.4 `oGhost` Step_2 Event
**File:** `objects/oGhost/Step_2.gml`

Handles movement, turning, wraparound, speed:
- All common movement logic
- House management
- Speed adjustment based on state
- Wraparound handling
- Tile-to-tile movement

#### 2.5 `oGhost` Draw_0 Event
**File:** `objects/oGhost/Draw_0.gml`

Parameterized sprite rendering:
```gml
// Get color from child object function
draw_color = ghost_get_color();

// Render sprite with variations for state
if state == GHOST_STATE.FRIGHTENED {
    // Draw with flashing effect
    if flash > 15 {
        draw_sprite_ext(..., ghost_get_color());
    } else {
        draw_sprite_ext(..., c_blue);  // Frightened color
    }
}
else {
    draw_sprite_ext(..., draw_color);
}

// Draw eyes separately
draw_eyes();
```

#### 2.6 `oGhost` Alarm_0 Event
**File:** `objects/oGhost/Alarm_0.gml`

Handles frightened response - identical for all ghosts

#### 2.7 `oGhost` Other_0 Event
**File:** `objects/oGhost/Other_0.gml`

Wraparound at tunnel

#### 2.8 `oGhost` Other_4 Event
**File:** `objects/oGhost/Other_4.gml`

Initialize speeds based on game mode

---

### PHASE 3: Create Ghost Personality System

#### 3.1 Personality Struct
**File:** `scripts/ghost_personality/ghost_personality.gml`

```gml
function create_ghost_personality(_name, _xstart, _ystart, _cornerx, _cornery) {
    return {
        name: _name,
        xstart: _xstart,
        ystart: _ystart,
        cornerx: _cornerx,
        cornery: _cornery,

        // Calculate target - overridden per ghost
        calculate_target: function() {
            // Default: chase current position
            return { x: Pac.tilex, y: Pac.tiley };
        }
    };
}

// Ghost personality definitions
blinky_personality = {
    name: "Blinky",
    xstart: 216,
    ystart: 224,
    cornerx: 32,
    cornery: 32,

    calculate_target: function() {
        // Direct chase: aim for Pac's current position
        return { x: 16 * round(Pac.x / 16), y: 16 * round(Pac.y / 16) };
    }
};

pinky_personality = {
    name: "Pinky",
    xstart: 216,
    ystart: 272,
    cornerx: 416,
    cornery: 32,

    calculate_target: function() {
        // Ambush: aim 4 tiles ahead of Pac
        return {
            x: 16 * round(Pac.x / 16) + (2 * Pac.xdir),
            y: 16 * round(Pac.y / 16) + (2 * Pac.ydir)
        };
    }
};

inky_personality = {
    name: "Inky",
    xstart: 184,
    ystart: 272,
    cornerx: 416,
    cornery: 416,

    calculate_target: function() {
        // Tricky: use Blinky position as reference
        var _blinky_offset_x = (16 * round(Pac.x / 16) + Pac.xdir) - Blinky.tilex;
        var _blinky_offset_y = (16 * round(Pac.y / 16) + Pac.ydir) - Blinky.tiley;

        return {
            x: Blinky.tilex + (_blinky_offset_x * 2),
            y: Blinky.tiley + (_blinky_offset_y * 2)
        };
    }
};

clyde_personality = {
    name: "Clyde",
    xstart: 248,
    ystart: 272,
    cornerx: 32,
    cornery: 416,

    calculate_target: function() {
        // Bashful: chase if far, flee if close
        var _dist = point_distance(x, y, Pac.x, Pac.y);
        if (_dist < 128) {
            // Too close! Return to scatter corner
            return { x: cornerx, y: cornery };
        } else {
            // Chase normally
            return { x: 16 * round(Pac.x / 16), y: 16 * round(Pac.y / 16) };
        }
    }
};
```

---

### PHASE 4: Refactor Individual Ghosts

Each ghost (Blinky, Pinky, Inky, Clyde) becomes a child of `oGhost`:

#### 4.1 Blinky Refactored
**File:** `objects/Blinky/Create_0.gml`

```gml
/// ===============================================================================
/// BLINKY - RED GHOST (Shadow)
/// Parent: oGhost
/// Personality: Direct pursuer - aggressively chases Pac's current position
/// Scatter Corner: Top-left (32, 32)
/// ===============================================================================

event_inherited();  // Call parent Create event

// Set Blinky-specific values
ghost_personality = blinky_personality;
ghost_name = "Blinky";
xstart = 216;
ystart = 224;
cornerx = 32;
cornery = 32;
```

**File:** `objects/Blinky/Step_1.gml`

```gml
/// ===============================================================================
/// BLINKY - STEP_1: Target Calculation
/// Purpose: Determine which direction Blinky should move
/// Logic: Directly chase Pac's current position (4-tile lookahead is Pinky's trick)
/// ===============================================================================

if state == GHOST_STATE.CHASE {
    // Blinky's behavior: Direct pursuit
    // Simply target Pac's current tile position
    pursuex = 16 * round(Pac.x / 16);
    pursuey = 16 * round(Pac.y / 16);
}
else if state == GHOST_STATE.EYES {
    // Eyes returning to house: Chase entrance
    pursuex = 216;
    pursuey = 240;
}

event_inherited();  // Call parent Step_1 for common logic
```

Similar for Pinky, Inky, Clyde with their unique target calculations.

---

## Implementation Roadmap

### Step 1: Create Enums & Utilities
- [ ] Create `GHOST_STATE` enum
- [ ] Create `GHOST_DIRECTION` enum
- [ ] Create color functions
- [ ] Create ghost personality system

### Step 2: Create Base Object
- [ ] Create `oGhost` object in editor
- [ ] Create `oGhost/Create_0.gml`
- [ ] Create `oGhost/Step_0.gml` (new event for animation/state updates)
- [ ] Create `oGhost/Step_1.gml` (target calculation placeholder)
- [ ] Create `oGhost/Step_2.gml` (movement logic)
- [ ] Create `oGhost/Draw_0.gml` (sprite rendering)
- [ ] Create `oGhost/Alarm_0.gml` (frightened response)
- [ ] Create `oGhost/Other_0.gml` (wraparound)
- [ ] Create `oGhost/Other_4.gml` (speed init)

### Step 3: Update Ghost Objects
- [ ] Update Blinky to inherit from oGhost
- [ ] Update Pinky to inherit from oGhost
- [ ] Update Inky to inherit from oGhost
- [ ] Update Clyde to inherit from oGhost

### Step 4: Add Comments
- [ ] Add extensive comments to all files
- [ ] Document all variable purposes
- [ ] Document all logic flow
- [ ] Add examples in comments

---

## Benefits of This Refactoring

### Code Quality
- **Reduced duplication**: 95% → 5% (estimated)
- **Easier to maintain**: Changes to ghost behavior in one place
- **Easier to debug**: Clear variable names and state machine
- **Easier to extend**: Add new ghosts without copy-paste

### Readability
- **Named states**: `GHOST_STATE.CHASE` vs `0`
- **Clear logic**: Enum values make intent obvious
- **Self-documenting**: Code explains itself through naming
- **Extensive comments**: Every variable purpose documented

### Maintainability
- **DRY principle**: No duplicate code
- **Single responsibility**: Each method has one job
- **Testability**: Individual methods can be tested in isolation
- **Extensibility**: Easy to add ghost variants or new behaviors

---

## Migration Path (Backward Compatible)

The refactoring maintains exact game behavior:

1. **No state values change**: CHASE=0, FRIGHTENED=1, EYES=2 (enums use same values)
2. **No variable names change**: All public variables kept identical
3. **No AI behavior changes**: Pathfinding logic copied exactly
4. **No performance impact**: Code structure identical to original

This means the refactoring is **fully backward compatible** with existing game logic.

---

## Testing Checklist

After refactoring, verify:
- [ ] Ghosts spawn at correct positions
- [ ] Chase behavior works (Pac is pursued)
- [ ] Scatter behavior works (ghosts go to corners)
- [ ] Frightened behavior works (random movement, flashing)
- [ ] Eyes behavior works (return to house after eaten)
- [ ] House exit logic works (bouncing out)
- [ ] Elroy mode works (faster when dots low)
- [ ] Speed transitions smooth
- [ ] Animation smooth (no freezing)
- [ ] All game modes playable (Pac-Man, Ms. Pac-Man, Jr. Pac-Man)

---

## Future Enhancements (Post-Refactoring)

Once refactored, these improvements become possible:

1. **Add ghost variants** - Create new ghost personalities easily
2. **Improve pathfinding** - Refactor `chase_object()` into smaller functions
3. **Add debug visualization** - Show target tile, current tile, path
4. **Tweak AI behavior** - Adjust ghost personalities with constants
5. **Create ghost formations** - Ghosts coordinate without copy-paste
6. **Add difficulty levels** - Adjust ghost speeds/behavior per level

---

## Conclusion

This refactoring transforms the Ghost system from a collection of copy-pasted objects into a clean, maintainable architecture with:
- ✅ Single source of truth for ghost logic
- ✅ Enum-based state machine for clarity
- ✅ Extensible personality system
- ✅ Extensive documentation via comments
- ✅ No behavioral changes (backward compatible)

The result is code that is **easier to understand**, **easier to maintain**, and **easier to extend**.
