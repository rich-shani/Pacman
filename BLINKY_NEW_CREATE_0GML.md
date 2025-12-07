# Blinky New Create_0.gml
## Exact Code to Use After Inheritance

This is the exact code you should put in `objects/Blinky/Create_0.gml` after setting oGhost as parent.

---

## The Code (Copy & Paste Ready)

```gml
/// ===== BLINKY CREATE_0.GML =====
/// Blinky ghost initialization with oGhost inheritance
///
/// This event runs when Blinky instance is created at room start.
/// event_inherited() loads all shared ghost variables from oGhost.
/// Then we override with Blinky-specific settings only.

/// ===== PARENT INITIALIZATION (MUST BE FIRST!) =====
/// Load all shared ghost variables from oGhost parent
/// This includes: animation, position, pathfinding, state, direction, speeds
event_inherited();

/// ===== BLINKY IDENTITY =====
/// Set Blinky's name and color (unique identity)
ghost_name = "Blinky";                      // Ghost identifier string
ghost_color = ghost_color_blinky();         // Red color: RGB(255, 0, 0)

/// ===== STARTING POSITION & SPAWN LOCATION =====
/// Set where Blinky spawns (center of ghost house)
xstart = 216;                               // Spawn X coordinate (pixel)
ystart = 224;                               // Spawn Y coordinate (pixel)
x = xstart;                                 // Place instance at spawn X
y = ystart;                                 // Place instance at spawn Y

/// ===== SCATTER MODE TARGET =====
/// When in scatter mode (not chasing), Blinky targets the top-left corner
cornerx = 32;                               // Scatter target X coordinate
cornery = 32;                               // Scatter target Y coordinate

/// ===== INITIAL STATE & DIRECTION =====
/// Set Blinky's starting state and facing direction
state = GHOST_STATE.CHASE;                  // Start in chase/scatter mode
dir = GHOST_DIRECTION.LEFT;                 // Start facing left
```

---

## What This Code Does

### Line 1-7: Header Comments
- Documents the event purpose
- Explains that event_inherited() loads parent variables
- Notes this is child-specific initialization

### Line 9-12: Parent Initialization
```gml
event_inherited();
```
**Critical:** This MUST be the first code line!

**What it does:**
- Calls oGhost's Create_0.gml
- Initializes all shared variables:
  - `im`, `flash`, `elroy` (animation)
  - `tilex`, `tiley` (position)
  - `pursuex`, `pursuey` (pathfinding targets)
  - `house`, `housestate` (house state)
  - `newtile`, `aboutface` (behavior flags)
  - `state` (AI state machine)
  - `direction`, `dir` (direction)
  - `sp`, `spslow`, `spfright`, `spelroy`, `spelroy2`, `speyes` (speeds)
  - `draw_color`, `image_index`, `image_speed` (rendering)

**After this line, all oGhost variables exist and are initialized!**

### Line 14-16: Blinky Identity
```gml
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();
```

**Sets Blinky-specific identity:**
- `ghost_name = "Blinky"` - String identifier (used in debug, comparisons)
- `ghost_color = ghost_color_blinky()` - Function returns `RGB(255, 0, 0)` (red)

### Line 19-22: Starting Position
```gml
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;
```

**Sets Blinky's spawn location:**
- `xstart = 216` - Respawn reference X (ghost house center)
- `ystart = 224` - Respawn reference Y
- `x = xstart` - Actual instance X position (pixel coordinate)
- `y = ystart` - Actual instance Y position

**Why store both?**
- `xstart/ystart` - Reference for respawning after being eaten
- `x/y` - Current position (modified as ghost moves)

### Line 25-26: Scatter Corner
```gml
cornerx = 32;
cornery = 32;
```

**Blinky's scatter mode target:**
- When scatter mode activates, Blinky pathfinds to (32, 32)
- This is the top-left corner of the maze
- Each ghost has different scatter corner

**Scatter corners (all ghosts):**
- Blinky: Top-left (32, 32)
- Pinky: Top-right (416, 32)
- Inky: Bottom-right (416, 416)
- Clyde: Bottom-left (32, 416)

### Line 29-30: Initial State
```gml
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

**Starting state and direction:**
- `state = GHOST_STATE.CHASE` - Begin in chase/scatter mode (not frightened or returning)
- `dir = GHOST_DIRECTION.LEFT` - Face left initially

**Note:** oGhost initializes `state` and `dir` to defaults, but we override with Blinky's starting values.

---

## Removed Code (What Was Deleted)

These lines were in the old Create_0.gml but are now removed because they're duplicated from oGhost:

### ❌ Animation Variables (Removed)
```gml
im = 0;                    // Now in oGhost
flash = 0;                 // Now in oGhost
```

### ❌ Position Tracking (Removed)
```gml
tilex = 0;                 // Now in oGhost
tiley = 0;                 // Now in oGhost
```
(xstart/ystart kept, tilex/tiley removed)

### ❌ Pathfinding Variables (Removed)
```gml
pursuex = 0;               // Now in oGhost
pursuey = 0;               // Now in oGhost
house = 0;                 // Now in oGhost
newtile = 0;               // Now in oGhost
aboutface = 0;             // Now in oGhost
```

### ❌ AI State (Removed - Overridden Instead)
```gml
elroydots = 244;           // Now in Other_4.gml (inherited from oGhost)
elroydots2 = 234;          // Now in Other_4.gml (inherited from oGhost)
```
(state and dir kept, but overridden with enum values)

### ❌ Direction Variables (Removed)
```gml
direction = 0;             // Now in oGhost
fruity = 0;                // Now in oGhost
codir = 0;                 // Now in oGhost
```
(dir kept for cardinal direction)

### ❌ Speed Variables (Removed)
```gml
sp = 1.875;                // Now in Other_4.gml (inherited from oGhost)
spslow = 1;                // Now in Other_4.gml (inherited from oGhost)
spfright = 1.25;           // Now in Other_4.gml (inherited from oGhost)
spelroy = 2;               // Now in Other_4.gml (inherited from oGhost)
spelroy2 = 2.125;          // Now in Other_4.gml (inherited from oGhost)
speyes = 4;                // Now in Other_4.gml (inherited from oGhost)
```

---

## Before vs After

### BEFORE (48 lines)
```gml
/// ===== BLINKY CREATE_0.GML ===== [12 lines of header]

// ===== ANIMATION & VISUAL VARIABLES =====
im = 0;
flash = 0;

// ===== POSITION TRACKING =====
tilex = 0;
tiley = 0;
xstart = 216;
ystart = 224;

// ===== PATHFINDING & BEHAVIOR =====
pursuex = 0;
pursuey = 0;
house = 0;
newtile = 0;
aboutface = 0;

// ===== AI STATE MACHINE =====
state = 0;
elroydots = 244;
cornerx = 32;
cornery = 32;

// ===== DIRECTION TRACKING =====
direction = 0;
dir = 0;
fruity = 0;
codir = 0;

[Total: 38 variable initializations]
```

### AFTER (30 lines)
```gml
/// ===== BLINKY CREATE_0.GML =====
event_inherited();  // Load oGhost variables

/// ===== BLINKY IDENTITY =====
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();

/// ===== STARTING POSITION & SPAWN LOCATION =====
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

/// ===== SCATTER MODE TARGET =====
cornerx = 32;
cornery = 32;

/// ===== INITIAL STATE & DIRECTION =====
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;

[Total: 7 variable assignments + 1 function call]
```

**Reduction: 48 → 30 lines (-37% duplication removed)**

---

## Step-by-Step Implementation

### Step 1: Open File
```
In GameMaker:
1. Expand objects/Blinky folder
2. Double-click Create_0.gml
3. Opens in code editor
```

### Step 2: Select All Content
```
Ctrl+A
```

### Step 3: Delete All Content
```
Delete or Backspace
```

### Step 4: Paste New Code
Copy the code above and paste it in (Ctrl+V)

### Step 5: Save
```
Ctrl+S or File → Save
```

### Step 6: Verify
```
Should see:
  - No red error squiggles
  - event_inherited() highlighted in syntax color
  - Ghost_name and ghost_color recognized
  - GHOST_STATE and GHOST_DIRECTION enum recognized
```

---

## Variables Reference

### oGhost Initializes (From event_inherited())
These are set by oGhost Create_0.gml, inherited by Blinky:

```gml
// Animation (Step_0.gml cycles these)
im = 0;                         // Frame counter: 0-15
flash = 0;                      // Flash state: 0=solid, 1=flashing
elroy = 0;                      // Elroy mode: 0/1/2

// Position & Grid
tilex = 0;                      // Tile X: grid-aligned position
tiley = 0;                      // Tile Y: grid-aligned position

// Pathfinding
pursuex = 0;                    // Chase target X
pursuey = 0;                    // Chase target Y
house = 0;                      // House state: 0=free, 1=in house
housestate = 0;                 // House sub-state
newtile = 0;                    // New tile flag
aboutface = 0;                  // Direction reversal flag

// State Machine
state = GHOST_STATE.CHASE;      // Current AI state
direction = 0;                  // Direction in degrees (0/90/180/270)
dir = GHOST_DIRECTION.RIGHT;    // Cardinal direction (0-3)

// Speeds
sp = 1.875;                     // Normal chase speed
spslow = 1.0;                   // Tunnel slow speed
spfright = 1.25;                // Frightened speed
spelroy = 2.0;                  // Elroy mode 1 speed
spelroy2 = 2.125;               // Elroy mode 2 speed
speyes = 4.0;                   // Eyes speed (returning to house)

// Rendering
draw_color = c_white;           // Ghost color
image_index = 0;                // Animation frame
image_speed = 0;                // Animation speed (manual control)

// Physics
hspeed = 0;                     // Horizontal velocity
vspeed = 0;                     // Vertical velocity
```

### Blinky Overrides (In this Create_0.gml)
These values are Blinky-specific:

```gml
ghost_name = "Blinky";          // Identifier: "Blinky"
ghost_color = RGB(255,0,0);     // Color: Red
xstart = 216;                   // Respawn X
ystart = 224;                   // Respawn Y
x = 216;                        // Starting X
y = 224;                        // Starting Y
cornerx = 32;                   // Scatter corner X
cornery = 32;                   // Scatter corner Y
state = GHOST_STATE.CHASE;      // Start in chase mode
dir = GHOST_DIRECTION.LEFT;     // Start facing left
```

---

## Verification

After copying the code, verify:

### Syntax Check
- [ ] No red squiggles in editor
- [ ] event_inherited() is recognized
- [ ] Enums GHOST_STATE and GHOST_DIRECTION are recognized
- [ ] Function ghost_color_blinky() is recognized

### Functionality Check
1. Save file
2. Run game (Ctrl+F5)
3. Verify:
   - Game starts without crashes
   - Blinky appears at (216, 224)
   - Blinky is red
   - No "undefined variable" errors
   - Blinky can move and animate

### Comparison Check
- Code is exactly 30 lines (or close)
- Only Blinky-specific values remain
- All shared variables inherited from oGhost
- Comments match structure above

---

## Common Issues & Fixes

### Issue: "Undefined variable: ghost_color_blinky"
**Cause:** Function doesn't exist

**Fix:** Verify `scripts/ghost_colors/ghost_colors.gml` exists and contains:
```gml
function ghost_color_blinky() {
    return make_color_rgb(255, 0, 0);
}
```

### Issue: "Undefined variable: im" or other oGhost variables
**Cause:** event_inherited() not called or called wrong

**Fix:** Ensure first code line is exactly:
```gml
event_inherited();
```

### Issue: "Unknown enum GHOST_STATE"
**Cause:** Enum not defined

**Fix:** Verify `scripts/GHOST_STATE/GHOST_STATE.gml` exists

### Issue: Blinky doesn't spawn or appears wrong
**Cause:** Parent not set or position values wrong

**Fix:**
1. Check oGhost is parent in Blinky.yy
2. Verify xstart=216, ystart=224, x=xstart, y=ystart
3. Check for typos in variable names

---

## Complete File Copy-Ready Format

Here's the code formatted for direct copying (no line numbers, no extra formatting):

```gml
/// ===== BLINKY CREATE_0.GML =====
/// Blinky ghost initialization with oGhost inheritance
///
/// This event runs when Blinky instance is created at room start.
/// event_inherited() loads all shared ghost variables from oGhost.
/// Then we override with Blinky-specific settings only.

/// ===== PARENT INITIALIZATION (MUST BE FIRST!) =====
/// Load all shared ghost variables from oGhost parent
/// This includes: animation, position, pathfinding, state, direction, speeds
event_inherited();

/// ===== BLINKY IDENTITY =====
/// Set Blinky's name and color (unique identity)
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();

/// ===== STARTING POSITION & SPAWN LOCATION =====
/// Set where Blinky spawns (center of ghost house)
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

/// ===== SCATTER MODE TARGET =====
/// When in scatter mode (not chasing), Blinky targets the top-left corner
cornerx = 32;
cornery = 32;

/// ===== INITIAL STATE & DIRECTION =====
/// Set Blinky's starting state and facing direction
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

---

## Next Steps

After implementing this Create_0.gml:

1. ✅ Save and compile
2. ✅ Test Blinky spawns correctly
3. ✅ Delete Step_2.gml from Blinky
4. ✅ Delete Other_0.gml from Blinky
5. ✅ Delete Other_4.gml from Blinky
6. ✅ Test all behavior matches original
7. ✅ Celebrate! 🎉

---

## Questions?

If something doesn't work:
1. Check INHERITANCE_QUICK_SUMMARY.md for TL;DR
2. Check BLINKY_INHERITANCE_STEPS.md for detailed phase info
3. Check this file again for code reference
4. Verify event_inherited() is first line
5. Verify oGhost is set as parent

---

**You're now ready to update Blinky Create_0.gml and complete the inheritance!**
