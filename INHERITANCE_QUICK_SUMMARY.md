# Blinky Inheritance Quick Summary
## What to Delete, What to Keep, What to Modify

---

## TL;DR - The Action Plan

### Delete These Files (Inherited from oGhost)
```
❌ Step_2.gml  (289 lines) - Use oGhost's instead
❌ Other_0.gml (19 lines)  - Use oGhost's instead
❌ Other_4.gml (148 lines) - Use oGhost's instead
────────────────────────────────────────────────
   DELETED: 456 lines total
```

### Keep These Files (Blinky Unique)
```
✅ Step_1.gml  (102 lines) - Blinky's chase behavior (unique!)
✅ Draw_0.gml  (221 lines) - Blinky's rendering (unique!)
✅ Alarm_0.gml (150 lines) - Blinky's eaten handling (maybe keep, maybe delete)
```

### Modify This File (Add Parent Call)
```
✏️ Create_0.gml (48→30 lines) - Add event_inherited(), remove duplicates
```

### Don't Touch (Automatically Inherited)
```
📦 Step_0.gml  - Not in Blinky, inherited from oGhost
```

---

## File Breakdown by Event

| Event | File Size | Unique? | Action | Why |
|-------|-----------|---------|--------|-----|
| Create | 48 lines | PARTIAL | Modify | Add event_inherited(), keep Blinky identity |
| Step_0 | — | NO | Nothing | Automatically inherited from oGhost |
| Step_1 | 102 lines | YES | Keep | This is Blinky's aggressive chase behavior |
| Step_2 | 289 lines | NO | **DELETE** | Identical to oGhost - use parent's |
| Draw_0 | 221 lines | YES | Keep | Blinky-specific rendering with effects |
| Alarm_0 | 150 lines | PARTIAL | **DECIDE** | Ghost reversal + Pac logic |
| Other_0 | 19 lines | NO | **DELETE** | Identical to oGhost - use parent's |
| Other_4 | 148 lines | NO | **DELETE** | Identical to oGhost - use parent's |

---

## Create_0.gml - Before and After

### BEFORE (48 lines)
```gml
/// ===== ANIMATION & VISUAL VARIABLES =====
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

[... more duplicates ...]
```

### AFTER (30 lines)
```gml
/// ===== BLINKY CREATE_0.GML =====
event_inherited();  // ← First line! Load oGhost variables

// Blinky identity
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();

// Starting position
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

// Scatter target
cornerx = 32;
cornery = 32;

// Initial state
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

---

## What Gets Inherited from oGhost

### Variables Initialized in oGhost Create_0
```
✅ im, flash, elroy           (Animation)
✅ tilex, tiley               (Position)
✅ pursuex, pursuey           (Pathfinding targets)
✅ house, housestate          (House state)
✅ newtile, aboutface         (Behavior flags)
✅ state                      (Ghost state machine)
✅ direction, dir             (Direction tracking)
✅ sp, spslow, spfright...    (Speed variables)
✅ draw_color                 (Rendering color)
```

All these are set by `event_inherited()`, no need to redefine!

### Events Inherited from oGhost
```
✅ Step_0.gml     - Animation cycling + flashing
✅ Other_0.gml    - Tunnel wraparound
✅ Other_4.gml    - Speed initialization by level
```

Just delete the Blinky versions and use parent's!

---

## Step-by-Step Quick Guide

### Step 1: Set Parent (GameMaker IDE)
```
Blinky properties → Parent Object → Select "oGhost" → Apply
```

### Step 2: Update Create_0.gml
```
1. Add: event_inherited() as first line
2. Keep: ghost_name, ghost_color, xstart, ystart, cornerx, cornery
3. Delete: All other variable initialization (im, tilex, state, direction, etc.)
```

### Step 3: Delete These Files
```bash
rm objects/Blinky/Step_2.gml
rm objects/Blinky/Other_0.gml
rm objects/Blinky/Other_4.gml
```

### Step 4: Keep These Files
```
✅ objects/Blinky/Create_0.gml   (modified)
✅ objects/Blinky/Step_1.gml     (unchanged)
✅ objects/Blinky/Draw_0.gml     (unchanged)
✅ objects/Blinky/Alarm_0.gml    (maybe modify)
```

### Step 5: Test
```
- Compile game
- Spawn Blinky
- Test all behavior (chase, scatter, frightened, house, speed, wrapping)
- Compare with original (should be identical!)
```

---

## Code Size Comparison

### Current State
```
Blinky total: ~700 lines
├── Create_0: 48 lines (mostly duplicates)
├── Step_1: 102 lines (unique!)
├── Step_2: 289 lines (duplicates)
├── Draw_0: 221 lines (unique!)
└── Alarm_0: 150 lines (mixed)

oGhost total: ~1,200 lines
└── All shared ghost logic
```

### After Inheritance
```
Blinky total: ~350 lines (50% reduction!)
├── Create_0: 30 lines (only Blinky identity)
├── Step_1: 102 lines (still unique)
└── Draw_0: 221 lines (still unique)

oGhost total: ~1,200 lines (unchanged)
└── All shared ghost logic + used by all ghosts
```

---

## What Each Event Does

### Create_0.gml (MODIFY)
**Purpose:** Initialize ghost
**Current:** Duplicates oGhost initialization
**Fix:** Add event_inherited(), remove duplicates
**Result:** Clean initialization, inherits shared variables

### Step_0.gml (NOTHING - Already Inherited)
**Purpose:** Animation + visibility
**Current:** Not in Blinky
**Inherited from:** oGhost
**Result:** Animations work automatically

### Step_1.gml (KEEP AS-IS)
**Purpose:** Calculate chase target
**Current:** Blinky's unique direct pursuit of Pac
**Why unique:** Each ghost has different chase behavior
**Result:** Keep all 102 lines, no changes

### Step_2.gml (DELETE)
**Purpose:** Movement, house logic, speed, turning
**Current:** 289 lines identical to oGhost
**Fix:** Delete the file entirely
**Result:** Inherit from oGhost (same behavior, no duplication)

### Draw_0.gml (KEEP AS-IS)
**Purpose:** Render ghost sprite
**Current:** Blinky-specific rendering with boost effects, modes
**Why unique:** Each ghost has different color, rendering
**Result:** Keep all 221 lines, no changes

### Alarm_0.gml (DECIDE)
**Purpose:** Handle ghost eaten response
**Current:** ~150 lines (ghost reversal + Pac movement)
**Options:**
- DELETE: Use oGhost only (simpler)
- KEEP with event_inherited(): Add Pac-specific logic

### Other_0.gml (DELETE)
**Purpose:** Horizontal tunnel wraparound
**Current:** 19 lines identical to oGhost
**Fix:** Delete the file entirely
**Result:** Inherit from oGhost (same behavior, no duplication)

### Other_4.gml (DELETE)
**Purpose:** Speed initialization by level/game
**Current:** 148 lines identical to oGhost
**Fix:** Delete the file entirely
**Result:** Inherit from oGhost (same behavior, no duplication)

---

## Key Rules

### Rule 1: event_inherited() Must Be First
```gml
/// CORRECT
event_inherited();  // First line!
ghost_name = "Blinky";

/// WRONG
ghost_name = "Blinky";
event_inherited();  // Too late!
```

### Rule 2: Only Override What's Unique
```gml
// ✅ GOOD - Unique to Blinky
Step_1.gml → Direct chase of Pac
Draw_0.gml → Red color + special rendering

// ❌ BAD - Duplicates oGhost
Step_2.gml → Same house/speed/turning logic
Other_0.gml → Same tunnel wrapping
Other_4.gml → Same speed initialization
```

### Rule 3: Don't Redefine Parent's Variables
```gml
// ❌ WRONG in Blinky Create_0
im = 0;         // Already in oGhost!
tilex = 0;      // Already in oGhost!
sp = 1.875;     // Already in oGhost!

// ✅ RIGHT in Blinky Create_0
ghost_name = "Blinky";    // New variable
xstart = 216;             // Override with Blinky's value
cornerx = 32;             // Blinky-specific scatter corner
```

---

## Testing Checklist

Quick test after each major change:

```
After Phase 1 (Parent Set):
  ☐ Project compiles
  ☐ No immediate errors

After Phase 2 (Create_0 Modified):
  ☐ Blinky spawns at (216, 224)
  ☐ Blinky is red color
  ☐ No undefined variable errors

After Phase 3-6 (Events Deleted):
  ☐ Game compiles
  ☐ Blinky moves smoothly
  ☐ Animation works
  ☐ Turning works
  ☐ Speed correct
  ☐ House logic works
  ☐ Tunnel wrapping works

Final Test:
  ☐ Chase behavior correct
  ☐ Scatter mode correct
  ☐ Frightened mode correct
  ☐ Eaten & house correct
  ☐ All speeds correct
  ☐ Behavior identical to original
```

---

## Files to Delete (With Commands)

```bash
# Delete in GameMaker IDE or command line

# Option 1: GameMaker IDE
# Right-click event → Delete Event

# Option 2: Command line
rm objects/Blinky/Step_2.gml     # 289 lines removed
rm objects/Blinky/Other_0.gml    # 19 lines removed
rm objects/Blinky/Other_4.gml    # 148 lines removed

# Verify deleted
ls objects/Blinky/*.gml
# Should show: Create_0.gml, Step_1.gml, Draw_0.gml, (maybe Alarm_0.gml)
# Should NOT show: Step_0.gml, Step_2.gml, Other_0.gml, Other_4.gml
```

---

## Expected Results After Completion

### Code Changes
- Blinky Create_0.gml: 48 → 30 lines ✅
- Blinky Step_1.gml: 102 lines (unchanged) ✅
- Blinky Draw_0.gml: 221 lines (unchanged) ✅
- Blinky Step_2.gml: DELETED ✅
- Blinky Other_0.gml: DELETED ✅
- Blinky Other_4.gml: DELETED ✅
- Total Blinky: ~350 lines (was ~700) ✅

### Behavior
- Gameplay identical to original ✅
- Movement smooth and responsive ✅
- All speeds correct ✅
- Rendering correct ✅
- No performance loss ✅

### Architecture
- oGhost is parent ✅
- Blinky is child ✅
- No code duplication ✅
- Clear separation of concerns ✅

---

## Common Mistakes to Avoid

### ❌ Mistake 1: Forgetting event_inherited()
```gml
// WRONG - Variables undefined!
ghost_name = "Blinky";
tilex = 0;  // ERROR: tilex not initialized by oGhost!

// RIGHT - Call parent first
event_inherited();
ghost_name = "Blinky";
// tilex already initialized by oGhost
```

### ❌ Mistake 2: Deleting Wrong Files
```
Don't delete:
  ❌ Step_1.gml  (This is unique to Blinky!)
  ❌ Draw_0.gml  (This is unique to Blinky!)

Do delete:
  ✅ Step_2.gml  (Identical to oGhost)
  ✅ Other_0.gml (Identical to oGhost)
  ✅ Other_4.gml (Identical to oGhost)
```

### ❌ Mistake 3: Redefining Parent Variables
```gml
// WRONG - Wastes space, prevents parent updates
im = 0;
tilex = 0;
state = 0;

// RIGHT - Let parent initialize
event_inherited();  // These are already set!
```

### ❌ Mistake 4: Not Testing After Each Change
```
Every deletion should be followed by:
  1. Compile test
  2. Run test
  3. Behavior test
```

---

## How to Revert If Something Goes Wrong

```bash
# Option 1: Git revert
git checkout objects/Blinky/

# Option 2: Manual restore from backup
# Restore from backup folder

# Option 3: Restore step-by-step
git checkout objects/Blinky/Step_2.gml
git checkout objects/Blinky/Other_0.gml
git checkout objects/Blinky/Other_4.gml
```

---

## Next: Apply Same Pattern to Other Ghosts

After Blinky works:

```
Apply same inheritance to:
1. Pinky  - Similar to Blinky
   ├── Keep: Step_1.gml (4-tile-ahead chase)
   └── Keep: Draw_0.gml (pink color)

2. Inky   - Complex behavior
   ├── Keep: Step_1.gml (Blinky+offset vector)
   └── Keep: Draw_0.gml (cyan color)

3. Clyde  - Distance-based
   ├── Keep: Step_1.gml (distance check)
   └── Keep: Draw_0.gml (orange color)
```

All follow same pattern: Delete shared, keep unique!

---

## Need More Details?

See: **BLINKY_INHERITANCE_STEPS.md**

This document has:
- Detailed 10-phase implementation plan
- Code examples for each change
- Testing procedures
- Troubleshooting guide
- Complete verification checklist

---

## TL;DR Summary

```
1. Set oGhost as parent in GameMaker
2. Modify Create_0.gml: Add event_inherited(), remove duplicates
3. Delete Step_2.gml, Other_0.gml, Other_4.gml
4. Keep Step_1.gml and Draw_0.gml (they're unique!)
5. Test: 456 lines removed, behavior unchanged ✅
```

**That's it! Your code just got 50% smaller and 100% more maintainable!**
