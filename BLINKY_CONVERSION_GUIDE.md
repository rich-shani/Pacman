# Blinky Object Conversion Guide
## Converting to use oGhost Parent & Enum-Based State Management

---

## Table of Contents
1. [Overview](#overview)
2. [Current Architecture](#current-architecture)
3. [Target Architecture](#target-architecture)
4. [Enum System Reference](#enum-system-reference)
5. [Step-by-Step Conversion](#step-by-step-conversion)
6. [Event-by-Event Refactoring](#event-by-event-refactoring)
7. [Testing Checklist](#testing-checklist)
8. [Best Practices](#best-practices)

---

## Overview

This guide walks through converting the **Blinky ghost object** from a standalone implementation to use:
- **oGhost** as a parent object for shared functionality
- **GHOST_STATE** enum for state machine management
- **GHOST_DIRECTION** enum for directional movement

### Why Convert?

**Benefits:**
- ✅ Code reusability across all four ghosts (Blinky, Pinky, Inky, Clyde)
- ✅ Consistent state and direction handling
- ✅ Easier to debug with named states/directions instead of magic numbers
- ✅ Centralized updates propagate to all ghosts
- ✅ Reduced file duplication
- ✅ Simpler maintenance and bug fixes

---

## Current Architecture

### Blinky as Standalone Object

**Location:** `objects/Blinky/`

**Events:**
- `Create_0.gml` - Initializes ~40 variables locally
- `Step_1.gml` - Animation + Pac pursuit targeting
- `Step_2.gml` - House logic, speed control, pathfinding
- `Draw_0.gml` - Sprite rendering with complex mode logic
- `Alarm_0.gml` - Ghost eaten collision response
- `Other_0.gml` - Horizontal tunnel wrapping
- `Other_4.gml` - Speed initialization by level/game mode

**Problems with Current Approach:**
- ❌ All variable initialization is local (not inherited)
- ❌ Uses magic numbers for states: `state = 0/1/2/3...`
- ❌ Uses magic numbers for directions: `dir = 0/1/2/3`
- ❌ Duplicated code across all 4 ghost objects
- ❌ Hard to maintain consistency
- ❌ No parent inheritance benefits

---

## Target Architecture

### Blinky Using oGhost Parent

**Parent Object:** `objects/oGhost/` (shared base)

**Blinky Responsibilities:**
1. Initialize ghost-specific variables (color, scatter corner, personality)
2. Override `Step_1.gml` with Blinky's unique chase behavior
3. Call parent methods for common functionality

**Variable Ownership:**

| Variable | Owner | Scope |
|----------|-------|-------|
| `state` | Both | oGhost initializes, Blinky uses via GHOST_STATE enum |
| `direction`, `dir` | Both | oGhost initializes, Blinky uses via GHOST_DIRECTION enum |
| `tilex`, `tiley` | oGhost | Shared across all ghosts |
| `sp`, `spelroy`, etc. | oGhost | Configured in oGhost Other_4.gml |
| `ghost_name` | Blinky | "Blinky" (set in Create_0.gml) |
| `color` | Blinky | Red RGB (set in Create_0.gml) |
| `cornerx`, `cornery` | Blinky | Top-left scatter target |

---

## Enum System Reference

### GHOST_STATE Enum

**File:** `scripts/GHOST_STATE/GHOST_STATE.gml`

**Usage:**
```gml
// Instead of: state = 0
state = GHOST_STATE.CHASE;

// Instead of: if (state == 0)
if (state == GHOST_STATE.CHASE) {
    // Chase/scatter behavior
}

// Instead of: if (state == 1)
if (state == GHOST_STATE.FRIGHTENED) {
    // Frightened behavior
}

// Instead of: state = 2
state = GHOST_STATE.EYES;  // Ghost eaten, returning home
```

**Valid States:**
```
GHOST_STATE.CHASE        = 0   // Chase mode or scatter mode (depends on Pac.scatter)
GHOST_STATE.FRIGHTENED   = 1   // Power pellet active, ghost is vulnerable
GHOST_STATE.EYES         = 2   // Ghost was eaten, eyes returning to house
GHOST_STATE.IN_HOUSE     = 3   // Inside ghost house
GHOST_STATE.HOUSE_READY  = 4   // In house, ready to exit
```

**Helper Functions:**
```gml
// Get string name for debugging
var state_name = ghost_state_name(state);
show_debug_message("Ghost state: " + state_name);  // Output: "CHASE" or "FRIGHTENED"
```

### GHOST_DIRECTION Enum

**File:** `scripts/GHOST_DIRECTION/GHOST_DIRECTION.gml`

**Usage:**
```gml
// Instead of: dir = 0
dir = GHOST_DIRECTION.RIGHT;

// Instead of: if (direction = 0)
if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT)) {
    // Moving right
}

// Instead of: dir = (direction/90)+2
var cardinal = cardinal_from_direction(direction);
```

**Valid Directions:**
```
GHOST_DIRECTION.RIGHT = 0   // Movement: +X (east)   [degree: 0°]
GHOST_DIRECTION.UP    = 1   // Movement: -Y (north)  [degree: 90°]
GHOST_DIRECTION.LEFT  = 2   // Movement: -X (west)   [degree: 180°]
GHOST_DIRECTION.DOWN  = 3   // Movement: +Y (south)  [degree: 270°]
```

**Conversion Functions:**
```gml
// Convert cardinal direction to degree format for physics engine
direction = direction_from_cardinal(GHOST_DIRECTION.RIGHT);  // Returns 0
direction = direction_from_cardinal(GHOST_DIRECTION.UP);     // Returns 90
direction = direction_from_cardinal(GHOST_DIRECTION.LEFT);   // Returns 180
direction = direction_from_cardinal(GHOST_DIRECTION.DOWN);   // Returns 270

// Convert degree format back to cardinal
var cardinal = cardinal_from_direction(direction);  // Returns 0-3

// Get opposite direction (for reversals)
var opposite = direction_opposite(GHOST_DIRECTION.RIGHT);  // Returns GHOST_DIRECTION.LEFT

// Get movement vector
var vec = direction_to_vector(GHOST_DIRECTION.UP);  // Returns {dx: 0, dy: -1}
```

---

## Step-by-Step Conversion

### Phase 1: Set oGhost as Parent (GameMaker Project)

**In GameMaker IDE:**

1. Right-click `Blinky` object → **Properties**
2. In the **Creation** section
3. Change **Parent Object** from `<none>` to `oGhost`
4. Click **Apply**

**Result:**
- Blinky now inherits all oGhost events
- `event_inherited()` must be called in overridden events

### Phase 2: Update Create_0.gml

**Current Code:**
```gml
// ===== ANIMATION & VISUAL VARIABLES =====
im = 0;
flash = 0;

// ===== POSITION TRACKING =====
tilex = 0;
tiley = 0;
xstart = 216;
ystart = 224;

// ... (40+ more variable initializations)
```

**Converted Code:**
```gml
/// ===== BLINKY CREATE EVENT - WITH oGhost INHERITANCE =====
/// Initialize parent ghost first (contains shared variables)
event_inherited();

/// ===== BLINKY-SPECIFIC INITIALIZATION =====
/// Ghost identity
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();  // RGB(255, 0, 0) - Red

/// Starting position (ghost house center)
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

/// Scatter mode target (top-left corner)
cornerx = 32;
cornery = 32;

/// Elroy activation thresholds (configure by level in Other_4.gml)
// NOTE: elroydots and elroydots2 are set in oGhost Other_4.gml
// Blinky uses default values; can override here if needed
// elroydots = 224;
// elroydots2 = 234;

/// Start state and direction
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

**Key Changes:**
1. `event_inherited()` at top - calls oGhost Create_0.gml
2. Remove all duplicate variable initializations (now in oGhost)
3. Use `GHOST_STATE` and `GHOST_DIRECTION` enums
4. Set Blinky-specific values only
5. Call color function instead of hardcoding RGB

### Phase 3: Update Step_1.gml

**Current Code (excerpt):**
```gml
/// Animation frame cycling
im = im + 1;
if (im >= 16) { im = 0; }

/// Frightened flashing pattern
var alarm_time = Pac.alarm[0];
if (alarm_time > 120) { flash = 0; }
else if (alarm_time <= 120 && alarm_time > 106) { flash = 1; }
// ... (many more conditions)

/// Pac pursuit target selection
var pac1_tilex = 16 * round(Pac.x / 16);
var pac1_tiley = 16 * round(Pac.y / 16);
// ... (distance calculations)
```

**Converted Code:**
```gml
/// ===== BLINKY STEP[1] EVENT - ANIMATION & PURSUIT =====
/// Handle Blinky-specific behavior
/// NOTE: Step[0] (physics) is handled by oGhost Step_0.gml

/// ===== ANIMATION FRAME MANAGEMENT =====
/// Increment frame counter (0-15 cycle for sprite animation)
im = im + 1;
if (im >= 16) {
    im = 0;
}

/// ===== FRIGHTENED STATE FLASHING EFFECT =====
/// During power pellet mode, ghost flashes to indicate vulnerability
/// Flash pattern becomes more rapid as frightened timer runs out

if (state == GHOST_STATE.FRIGHTENED) {
    var alarm_time = Pac.alarm[0];

    // Flashing pattern: on/off cycles that increase in frequency
    if (alarm_time > 120) {
        flash = 0;  // Solid (first 120 frames)
    } else if (alarm_time <= 120 && alarm_time > 106) {
        flash = 1;  // Transparent (14 frame cycle)
    } else if (alarm_time <= 106 && alarm_time > 92) {
        flash = 0;  // (14 frame cycle)
    } else if (alarm_time <= 92 && alarm_time > 78) {
        flash = 1;  // (14 frame cycle)
    } else if (alarm_time <= 78 && alarm_time > 64) {
        flash = 0;  // (14 frame cycle)
    } else if (alarm_time <= 64 && alarm_time > 50) {
        flash = 1;  // Frequency increases
    } else if (alarm_time <= 50 && alarm_time > 36) {
        flash = 0;
    } else if (alarm_time <= 36 && alarm_time > 22) {
        flash = 1;  // Rapid flashing
    } else if (alarm_time <= 22 && alarm_time > 8) {
        flash = 0;
    } else if (alarm_time <= 8) {
        flash = 1;  // Rapid flashing end
    }
}

/// ===== BLINKY'S CHASE BEHAVIOR: DIRECT PURSUIT =====
/// Blinky chases Pac's CURRENT position (most aggressive ghost)
/// Personality: "Shadow" - follows Pac directly

// Convert Pac positions to tile coordinates
var pac1_tilex = 16 * round(Pac.x / 16);
var pac1_tiley = 16 * round(Pac.y / 16);
var pac2_tilex = 16 * round(Pac.x2 / 16);
var pac2_tiley = 16 * round(Pac.y2 / 16);

// Calculate Manhattan distances
var dist_to_pac1 = abs(pac1_tilex - tilex) + abs(pac1_tiley - tiley);
var dist_to_pac2 = abs(pac2_tilex - tilex) + abs(pac2_tiley - tiley);

// Select closest target (or randomize if equal distance)
if (dist_to_pac1 == dist_to_pac2) {
    if (irandom(1) == 1) {
        pursuex = pac2_tilex;
        pursuey = pac2_tiley;
    } else {
        pursuex = pac1_tilex;
        pursuey = pac1_tiley;
    }
} else if (dist_to_pac2 < dist_to_pac1) {
    pursuex = pac2_tilex;
    pursuey = pac2_tiley;
} else {
    pursuex = pac1_tilex;
    pursuey = pac1_tiley;
}
```

**Key Changes:**
1. Don't call `event_inherited()` in Step events (physics is separate)
2. Keep Blinky-specific pursuit logic
3. Use `GHOST_STATE.FRIGHTENED` instead of `state == 1`
4. Keep complex animation/flashing logic (Blinky-specific)

### Phase 4: Update Step_2.gml

**Key Changes:**
```gml
/// ===== BLINKY STEP[2] EVENT - HOUSE & PATHFINDING =====
/// House exit state machine, direction turning, pathfinding

// Use enum values instead of magic numbers
if (state == GHOST_STATE.CHASE) {
    // Chase/scatter behavior
    if (house == 0) {
        // Pathfinding logic...
    }
} else if (state == GHOST_STATE.FRIGHTENED) {
    // Frightened behavior
} else if (state == GHOST_STATE.EYES) {
    // Eyes returning home
}

// Direction turning with enums
if (dir == GHOST_DIRECTION.RIGHT) {
    // Handle RIGHT turn
} else if (dir == GHOST_DIRECTION.UP) {
    // Handle UP turn
} else if (dir == GHOST_DIRECTION.LEFT) {
    // Handle LEFT turn
} else if (dir == GHOST_DIRECTION.DOWN) {
    // Handle DOWN turn
}
```

### Phase 5: Update Draw_0.gml

**Key Changes:**
```gml
/// ===== BLINKY DRAW EVENT =====
/// Use enum states for clarity
/// Don't call event_inherited() - Draw is Blinky-specific

if (state == GHOST_STATE.CHASE) {
    // Draw normal ghost (red)
    draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, ghost_color, 1);
} else if (state == GHOST_STATE.FRIGHTENED) {
    // Draw frightened ghost (blue with flashing)
    var fright_color = make_color_rgb(flash * 255, flash * 255, 255);
    draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, fright_color, 1);
} else if (state == GHOST_STATE.EYES) {
    // Draw eyes only (no body)
    draw_sprite(spr_Eyes, dir, x, y);
}
```

### Phase 6: Update Other_0.gml (Tunnel Wrapping)

**Current Code:**
```gml
if (direction == 180 && x < -24) {
    x = (room_width + 24) - (x + 24);
    tilex = 16 * round(x / 16);
}
if (direction == 0 && x > (room_width + 24)) {
    x = -24 + (x - (room_width + 24));
    tilex = 16 * round(x / 16);
}
```

**Converted Code:**
```gml
/// ===== BLINKY OTHER[0] EVENT - TUNNEL WRAPPING =====
/// Handle horizontal wrapping at maze edges

// Wrap at left edge
if (direction == direction_from_cardinal(GHOST_DIRECTION.LEFT) && x < -24) {
    x = (room_width + 24) - (x + 24);
    tilex = 16 * round(x / 16);
}

// Wrap at right edge
if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT) && x > (room_width + 24)) {
    x = -24 + (x - (room_width + 24));
    tilex = 16 * round(x / 16);
}
```

**Why the Conversion Function?**
- `direction` is stored in degree format (0/90/180/270)
- `GHOST_DIRECTION` enum uses cardinal format (0/1/2/3)
- Need `direction_from_cardinal()` to convert between formats

### Phase 7: Update Other_4.gml (Speed Initialization)

**Current Code:**
```gml
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);
newtile = 0;

if (global.game < 2) {
    sp = 1.875;
    spslow = 1;
    // ... (speed configs)
}
state = 0;
dir = 2;
```

**Converted Code:**
```gml
/// ===== BLINKY OTHER[4] EVENT - SPAWN INITIALIZATION =====
/// Additional setup called at room start
/// Complements Create_0.gml initialization

// Snap to tile grid
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);
newtile = 0;

/// Speed configuration by level/game mode
/// (Same logic as before)
if (global.game < 2) {
    sp = 1.875;
    spslow = 1;
    spfright = 1.25;
    spelroy = 2;
    spelroy2 = 2.125;
    // ... (rest of speed config)
}

/// Ensure correct enum values
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;  // Start facing left
```

### Phase 8: Update Alarm_0.gml (Eaten Response)

**Key Changes:**
```gml
/// ===== BLINKY ALARM[0] - GHOST EATEN =====

// Reverse all ghost directions
with (Blinky) {
    if (house == 0 && state < GHOST_STATE.EYES) {
        direction = resdir * 90;
    }
    resdir = -1;
}

// ... (similar for other ghosts)

// Blinky state transition: Chase → Eyes
state = GHOST_STATE.EYES;  // Instead of state = 2;
chomped = 0;

/// Pac movement after eating ghost
with (Pac) {
    if (state == GHOST_STATE.FRIGHTENED) {  // Instead of checking fright flag
        // ... (movement logic)
    }
}
```

---

## Event-by-Event Refactoring

### Create_0.gml

**Purpose:** Initialize ghost at room start
**Inherits from:** oGhost

```gml
/// ===== BLINKY CREATE_0.GML =====
event_inherited();  // Call oGhost Create_0.gml first

// Blinky identity
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();

// Starting position
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

// Scatter target (top-left)
cornerx = 32;
cornery = 32;

// Initial state
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

**Checklist:**
- ✅ Call `event_inherited()` first
- ✅ Set `ghost_name`
- ✅ Set `ghost_color` using color function
- ✅ Set starting position
- ✅ Set scatter corner
- ✅ Use enum values for state/dir

### Step_1.gml

**Purpose:** Animation + Blinky's unique chase behavior
**Does NOT inherit:** Blinky handles its own animation

```gml
/// Animation cycling
im = im + 1;
if (im >= 16) { im = 0; }

/// Frightened flashing
if (state == GHOST_STATE.FRIGHTENED) {
    // Flash pattern based on Pac.alarm[0]
}

/// Blinky chase target (direct pursuit)
// Calculate Pac tile position
// Select closest target
pursuex = pac_tilex;
pursuey = pac_tiley;
```

**Checklist:**
- ✅ Do NOT call `event_inherited()`
- ✅ Use `GHOST_STATE.FRIGHTENED` instead of `state == 1`
- ✅ Keep Blinky-specific pursuit logic
- ✅ Comment complex behavior

### Step_2.gml

**Purpose:** House logic, pathfinding, speed control
**Does NOT inherit:** Blinky-specific house state machine

```gml
/// House management
if (house == 1) {
    // House entry/exit logic
}

/// Speed selection
if (state == GHOST_STATE.CHASE) {
    if (Pac.dotcount >= elroydots2) {
        speed = spelroy2;
    } else if (Pac.dotcount >= elroydots) {
        speed = spelroy;
    } else {
        speed = sp;
    }
} else if (state == GHOST_STATE.FRIGHTENED) {
    speed = spfright;
} else if (state == GHOST_STATE.EYES) {
    speed = speyes;
}

/// Direction turning
if (newtile == 1) {
    if (dir == GHOST_DIRECTION.RIGHT) {
        // Turn right logic
    } else if (dir == GHOST_DIRECTION.UP) {
        // Turn up logic
    } else if (dir == GHOST_DIRECTION.LEFT) {
        // Turn left logic
    } else if (dir == GHOST_DIRECTION.DOWN) {
        // Turn down logic
    }
}
```

**Checklist:**
- ✅ Do NOT call `event_inherited()`
- ✅ Use enum values in conditions
- ✅ Clear comments for house state machine
- ✅ Explicit enum checks for direction turning

### Draw_0.gml

**Purpose:** Render Blinky sprite
**Does NOT inherit:** Blinky-specific rendering

```gml
if (Pac.alarm[9] == -1 && chomped == 0) {
    if (state == GHOST_STATE.CHASE) {
        // Draw red ghost
        draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, ghost_color, 1);
    } else if (state == GHOST_STATE.FRIGHTENED) {
        // Draw blue ghost with flash
        var color = make_color_rgb(flash * 255, flash * 255, 255);
        draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, color, 1);
    } else if (state == GHOST_STATE.EYES) {
        // Draw eyes only
        draw_sprite(spr_Eyes, dir, x, y);
    }
}
```

**Checklist:**
- ✅ Do NOT call `event_inherited()`
- ✅ Use `ghost_color` variable instead of hardcoded RGB
- ✅ Use enum values in conditions
- ✅ Clear conditional flow

### Other_0.gml

**Purpose:** Horizontal tunnel wrapping
**Does NOT inherit**

```gml
/// Left edge wrap
if (direction == direction_from_cardinal(GHOST_DIRECTION.LEFT) && x < -24) {
    x = (room_width + 24) - (x + 24);
    tilex = 16 * round(x / 16);
}

/// Right edge wrap
if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT) && x > (room_width + 24)) {
    x = -24 + (x - (room_width + 24));
    tilex = 16 * round(x / 16);
}
```

**Checklist:**
- ✅ Use conversion function for cardinal ↔ degree
- ✅ Comment both edges clearly

### Other_4.gml

**Purpose:** Speed initialization at room start
**Does NOT inherit**

```gml
/// Tile alignment
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);
newtile = 0;

/// Speed configuration (unchanged logic)
if (global.game < 2) {
    sp = 1.875;
    // ... rest of config
}

/// Ensure enum values
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

**Checklist:**
- ✅ Replace magic numbers with enums
- ✅ Keep speed configuration logic unchanged
- ✅ Comment section headers

### Alarm_0.gml

**Purpose:** Handle ghost eaten by Pac
**Does NOT inherit**

```gml
/// Reverse all ghost directions
with (Blinky) {
    if (house == 0 && state < GHOST_STATE.EYES) {
        direction = resdir * 90;
    }
    resdir = -1;
}

/// Blinky state change
state = GHOST_STATE.EYES;
chomped = 0;

/// Pac movement
with (Pac) {
    if (state == GHOST_STATE.FRIGHTENED) {
        // Pac movement logic
    }
}
```

**Checklist:**
- ✅ Use `GHOST_STATE.EYES` instead of `state = 2`
- ✅ Use enums in condition checks
- ✅ Clear comments on state transitions

---

## Testing Checklist

### Before Conversion
- [ ] Blinky spawns at correct position
- [ ] Blinky chases Pac correctly
- [ ] Blinky enters scatter mode at correct time
- [ ] Blinky speeds up in Elroy mode
- [ ] Blinky turns blue when Pac eats power pellet
- [ ] Blinky flashes at end of frightened mode
- [ ] Blinky can be eaten and returns to house
- [ ] Blinky wraps through horizontal tunnels
- [ ] Blinky animations play smoothly

### After Conversion (Incremental Testing)

**Phase 1: Setup**
- [ ] GameMaker project recognizes oGhost as Blinky's parent
- [ ] Create_0.gml compiles without errors
- [ ] Game starts without crashes

**Phase 2: Initial Behavior**
- [ ] Blinky spawns at (216, 224)
- [ ] Blinky has red color
- [ ] Blinky starts in GHOST_STATE.CHASE
- [ ] Blinky initial direction is GHOST_DIRECTION.LEFT

**Phase 3: Chase Behavior**
- [ ] Blinky pursues Pac smoothly
- [ ] Pursuit targeting still works (checks Pac.x and Pac.x2)
- [ ] Chase target updates every tile

**Phase 4: House Logic**
- [ ] Blinky respawns correctly after being eaten
- [ ] House entry/exit state machine works
- [ ] Speed changes during house exit

**Phase 5: Enum Values**
- [ ] `state == GHOST_STATE.CHASE` evaluates correctly
- [ ] `state == GHOST_STATE.FRIGHTENED` evaluates correctly
- [ ] `state == GHOST_STATE.EYES` evaluates correctly
- [ ] `dir == GHOST_DIRECTION.RIGHT/UP/LEFT/DOWN` all work

**Phase 6: Visual**
- [ ] Blinky renders as red ghost
- [ ] Blinky renders as blue when frightened
- [ ] Flash effect works during end of frightened mode
- [ ] Eyes render correctly when state = EYES

**Phase 7: Tunnels**
- [ ] Left tunnel wrapping works
- [ ] Right tunnel wrapping works
- [ ] Tile coordinates update after wrapping

**Phase 8: Advanced**
- [ ] Elroy mode speeds up correctly
- [ ] Speed changes based on global.game value
- [ ] Speed changes based on global.lvl value
- [ ] Power pellet interaction works

### Regression Testing (Compare to Original)
```gml
// Test comparison: original vs converted
// In Create_0.gml, log initial state

show_debug_message("Blinky init: state=" + string(state)
    + ", dir=" + string(dir)
    + ", ghost_name=" + ghost_name
    + ", x=" + string(x) + ", y=" + string(y));

// Expected output:
// "Blinky init: state=0, dir=2, ghost_name=Blinky, x=216, y=224"
// (or with CHASE=0, LEFT=2 enums)
```

---

## Best Practices

### 1. Always Use Enum Values

**Bad:**
```gml
state = 0;  // What does 0 mean? Chase? Frightened?
if (state == 1) {  // Unclear comparison
    // ...
}
```

**Good:**
```gml
state = GHOST_STATE.CHASE;
if (state == GHOST_STATE.FRIGHTENED) {
    // ...
}
```

**Why:** Self-documenting code that's easy to maintain

### 2. Use Conversion Functions for Degree ↔ Cardinal

**Bad:**
```gml
direction = dir * 90;  // Magic number, unclear
if (direction = 180) {  // Hard to match with enum
    // ...
}
```

**Good:**
```gml
direction = direction_from_cardinal(dir);
if (direction == direction_from_cardinal(GHOST_DIRECTION.LEFT)) {
    // ...
}
```

**Why:** Eliminates magic numbers and keeps conversions consistent

### 3. Call event_inherited() First in Create

**Bad:**
```gml
ghost_name = "Blinky";
event_inherited();  // Late call
xstart = 216;
```

**Good:**
```gml
event_inherited();  // First thing
ghost_name = "Blinky";
xstart = 216;
```

**Why:** Ensures parent initialization happens before child overrides

### 4. Document State Transitions

**Good Practice:**
```gml
/// When Pac eats power pellet:
/// state = GHOST_STATE.CHASE → GHOST_STATE.FRIGHTENED

/// When ghost is eaten:
/// state = GHOST_STATE.CHASE/FRIGHTEN → GHOST_STATE.EYES

/// When eyes reach house:
/// state = GHOST_STATE.EYES → GHOST_STATE.IN_HOUSE
```

### 5. Use Color Functions Instead of Hardcoded RGB

**Bad:**
```gml
ghost_color = make_color_rgb(255, 0, 0);  // Is this red? Orange?
```

**Good:**
```gml
ghost_color = ghost_color_blinky();  // Clear intent
```

**Why:** Self-documenting and consistent with all ghosts

### 6. Comment Complex Logic

**Keep Complex Behavior:**
```gml
// Blinky's unique chase: pursue Pac's current position (aggressive)
// vs. Pinky's chase: target 4 tiles ahead (predictive)
// vs. Inky's chase: complex vector math
var pac_tilex = 16 * round(Pac.x / 16);
pursuex = pac_tilex;
```

**Why:** Each ghost has unique personality; document what makes Blinky different

### 7. Avoid Magic Numbers

**Track Constants:**
```gml
// Use named variables for game mechanics
var ELROY_THRESHOLD_1 = 224;  // Activate elroy when dots ≤ this
var ELROY_THRESHOLD_2 = 234;

if (Pac.dotcount <= ELROY_THRESHOLD_1) {
    elroy = 1;
}
```

### 8. Test Enum Values with Debug Output

**During Development:**
```gml
show_debug_message("State: " + ghost_state_name(state));
show_debug_message("Direction: " + direction_name(dir));
```

**Why:** Quickly verify state values during testing

---

## Common Pitfalls & Solutions

### Pitfall 1: Forgetting event_inherited()

**Symptom:** Variables like `tilex`, `tiley` are undefined

**Solution:**
```gml
// Top of Blinky Create_0.gml
event_inherited();
```

### Pitfall 2: Mixing Cardinal and Degree Formats

**Symptom:** Direction comparisons don't work

**Original Code:**
```gml
dir = 0;  // Cardinal: RIGHT
direction = 0;  // Degree: also happens to be RIGHT

direction = dir * 90;  // ✅ Works: 0*90=0, 1*90=90, 2*90=180, 3*90=270
```

**After Conversion:**
```gml
dir = GHOST_DIRECTION.RIGHT;  // Cardinal: 0
direction = direction_from_cardinal(dir);  // Degree: 0

// ❌ Wrong:
if (direction == GHOST_DIRECTION.RIGHT) {  // Comparing degree to cardinal!
}

// ✅ Correct:
if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT)) {
}

// ✅ Or convert and store:
var target_dir = direction_from_cardinal(GHOST_DIRECTION.RIGHT);
if (direction == target_dir) {
}
```

**Solution:** Always use conversion functions when comparing degree format to cardinal enum

### Pitfall 3: Overriding Parent Behavior Accidentally

**Symptom:** Ghost doesn't move, position doesn't update

**Issue:** oGhost Step_0.gml handles physics (`hspeed`, `vspeed` → position update)

**Solution:** Don't call `event_inherited()` in Step_0.gml or Step_1.gml:
```gml
// Step_1.gml: Animation & targeting (Blinky-specific)
// Do NOT call event_inherited() here

// Step_0.gml: Called by parent (oGhost)
// Blinky doesn't override this
```

### Pitfall 4: State Comparisons with Old Magic Numbers

**Symptom:** Logic works sometimes, fails other times

**Original Code:**
```gml
if (state < 2) {  // "If not eyes"
    // ...
}
```

**After Conversion:**
```gml
// ❌ Still works, but unclear:
if (state < 2) {  // Is 2 EYES? Confusing!
}

// ✅ Clear intent:
if (state < GHOST_STATE.EYES) {
    // Still not in eyes mode
}
```

---

## Verification Script

Add this to a test room to verify conversion:

```gml
/// Test script for Blinky conversion
function verify_blinky_conversion() {
    // Check enum values exist
    assert(GHOST_STATE.CHASE == 0);
    assert(GHOST_STATE.FRIGHTENED == 1);
    assert(GHOST_STATE.EYES == 2);

    assert(GHOST_DIRECTION.RIGHT == 0);
    assert(GHOST_DIRECTION.UP == 1);
    assert(GHOST_DIRECTION.LEFT == 2);
    assert(GHOST_DIRECTION.DOWN == 3);

    // Check Blinky initial state
    assert(Blinky.ghost_name == "Blinky");
    assert(Blinky.state == GHOST_STATE.CHASE);
    assert(Blinky.dir == GHOST_DIRECTION.LEFT);
    assert(Blinky.x == 216);
    assert(Blinky.y == 224);

    // Check inherited variables from oGhost
    assert(Blinky.tilex != undefined);
    assert(Blinky.tiley != undefined);
    assert(Blinky.sp != undefined);
    assert(Blinky.cornerx == 32);
    assert(Blinky.cornery == 32);

    show_debug_message("✅ Blinky conversion verified!");
}

// Call in room creation code:
verify_blinky_conversion();
```

---

## After Conversion: Next Steps

### 1. Apply Same Pattern to Other Ghosts

Once Blinky works, apply the same pattern to:
- **Pinky** (Pink ghost) - unique chase: target 4 tiles ahead
- **Inky** (Cyan ghost) - unique chase: complex vector from Blinky
- **Clyde** (Orange ghost) - unique chase: distance-based cowardice

### 2. Consolidate Duplicate Code

After all ghosts use oGhost parent:
- Move common Step_2.gml logic to oGhost Step_2.gml
- Move common Draw_0.gml logic to oGhost Draw_0.gml
- Keep only ghost-specific behavior in child objects

### 3. Add Ghost Manager System

Create a `Ghost_Manager` or `Ghost_Spawner` object:
```gml
/// Centralized ghost initialization
function spawn_ghosts() {
    instance_create_layer(216, 224, "Instances", Blinky);
    instance_create_layer(216, 272, "Instances", Pinky);
    instance_create_layer(184, 272, "Instances", Inky);
    instance_create_layer(248, 272, "Instances", Clyde);
}
```

### 4. Create Ghost Behavior Scripts

Separate unique chase behavior into scripts:
```gml
/// Blinky chase
function ghost_chase_blinky() {
    var target_x = Pac.x;
    var target_y = Pac.y;
    return {x: target_x, y: target_y};
}

/// Pinky chase
function ghost_chase_pinky() {
    // 4 tiles ahead of Pac
    return {x: Pac.x + 64, y: Pac.y - 64};
}
```

---

## Summary

**Conversion Benefits:**
✅ Code reuse across 4 ghosts
✅ Readable enum-based states
✅ Centralized updates propagate to all
✅ Easier debugging and maintenance
✅ Self-documenting code

**Key Files to Modify:**
1. Blinky.yy (set parent to oGhost)
2. Create_0.gml (call event_inherited, set ghost-specific vars)
3. Step_1.gml, Step_2.gml (replace magic numbers with enums)
4. Draw_0.gml (use ghost_color variable)
5. Other_0.gml, Other_4.gml (use enum values)
6. Alarm_0.gml (use GHOST_STATE enum)

**Testing Focus:**
- ✅ Initial spawn position and color
- ✅ Chase behavior accuracy
- ✅ Enum value comparisons
- ✅ Visual rendering
- ✅ Tunnel wrapping
- ✅ House logic
- ✅ Power pellet interaction

---

## References

**Related Files:**
- `objects/oGhost/` - Parent ghost implementation
- `scripts/GHOST_STATE/` - State enum definition
- `scripts/GHOST_DIRECTION/` - Direction enum definition
- `scripts/ghost_colors/` - Color function library

**Related Objects:**
- `objects/Pinky/` - Similar structure for comparison
- `objects/Inky/` - Complex chase behavior example
- `objects/Clyde/` - Distance-based behavior example

---

**Document Version:** 1.0
**Last Updated:** 2025-12-06
**Created for:** Pacman Ghost Refactoring Project
