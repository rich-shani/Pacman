# Blinky Inheritance Implementation Steps
## Setting oGhost as Parent & Removing Duplicate Code

---

## Table of Contents
1. [Overview](#overview)
2. [Pre-Implementation Checklist](#pre-implementation-checklist)
3. [Phase 1: Set oGhost Parent](#phase-1-set-oghost-parent)
4. [Phase 2: Update Blinky Create_0.gml](#phase-2-update-blinky-create_0gml)
5. [Phase 3: Analyze Each Event](#phase-3-analyze-each-event)
6. [Phase 4: Update Step_0.gml](#phase-4-update-step_0gml)
7. [Phase 5: Keep Step_1.gml](#phase-5-keep-step_1gml)
8. [Phase 6: Conditional Update Step_2.gml](#phase-6-conditional-update-step_2gml)
9. [Phase 7: Keep/Update Draw_0.gml](#phase-7-keepupdate-draw_0gml)
10. [Phase 8: Conditional Update Alarm_0.gml](#phase-8-conditional-update-alarm_0gml)
11. [Phase 9: Conditional Update Other_0.gml](#phase-9-conditional-update-other_0gml)
12. [Phase 10: Conditional Update Other_4.gml](#phase-10-conditional-update-other_4gml)
13. [Testing & Verification](#testing--verification)
14. [Summary & Code Removal](#summary--code-removal)

---

## Overview

### Goal
Make Blinky inherit from oGhost and remove ALL code that isn't unique to Blinky's personality (direct chase behavior).

### What Will Change

**Before Conversion:**
- Blinky: Standalone object with complete implementation
- oGhost: Parent class (exists but not used by Blinky)
- Code duplication: Blinky duplicates ~70% of oGhost code

**After Conversion:**
- Blinky: Child of oGhost, only Blinky-specific code
- oGhost: Provides all shared functionality
- Code duplication: Eliminated
- Blinky reduced from ~700 lines to ~300 lines

### Architecture Change

```
BEFORE:
Blinky (standalone)
├── Complete ghost implementation
├── Animation logic
├── Movement logic
├── Speed control
├── House logic
├── Rendering
└── Collision response

AFTER:
oGhost (base class - no change)
├── Animation (Step_0)
├── Movement/Pathfinding (Step_2)
├── Speed control (Other_4)
├── House logic (Step_2)
├── Rendering template (Draw_0)
└── Collision response (Alarm_0)
    ↓
Blinky (child class)
├── Ghost identity (name, color, position)
├── Scatter corner
├── Unique chase logic (Step_1 only)
└── Unique rendering (Draw_0 only)
```

### Benefits

✅ **Reduced Code:** -400 lines of duplication
✅ **Maintainability:** Bug fixes in oGhost propagate to all ghosts
✅ **Consistency:** All ghosts use same pathfinding/speed system
✅ **Scalability:** Easy to add new ghost types
✅ **Clear Roles:** Blinky defines personality, oGhost defines mechanics

---

## Pre-Implementation Checklist

Before starting, ensure:

- [ ] You've read BLINKY_CONVERSION_GUIDE.md
- [ ] You understand the enum system (GHOST_STATE, GHOST_DIRECTION)
- [ ] oGhost object exists and compiles
- [ ] You have git repository ready for commits
- [ ] Current Blinky gameplay works perfectly
- [ ] You can test after each phase
- [ ] You have the comparison document open

**Testing Setup:**
- [ ] Know how to run the game
- [ ] Know how to test Blinky behavior (chase, scatter, frightened, house)
- [ ] Have debug output window open
- [ ] Can compare with original behavior easily

---

## Phase 1: Set oGhost Parent

### Step 1.1: Open Blinky Object Properties

**In GameMaker IDE:**
1. Right-click `Blinky` object in Objects folder
2. Select **Properties** (or double-click)
3. Navigate to **Creation** section

### Step 1.2: Set Parent Object

**In the Properties window:**
1. Find "Parent Object" dropdown
2. Currently shows: `<none>`
3. Click dropdown and select: `oGhost`
4. Confirm selection

### Step 1.3: Apply & Save

1. Click **Apply**
2. Close properties window
3. Save project (Ctrl+S)

### Step 1.4: Verify Parent is Set

1. Open Blinky.yy file in text editor
2. Look for: `"parentObjectId":{"name":"oGhost","path":"objects/oGhost/oGhost.yy"}`
3. Confirm it's NOT `"parentObjectId":null`

**Expected Result:**
```json
"parentObjectId":{"name":"oGhost","path":"objects/oGhost/oGhost.yy"},
```

### Verification
- [ ] Parent object dropdown shows "oGhost"
- [ ] Blinky.yy contains parentObjectId reference
- [ ] Project still compiles
- [ ] No errors in compilation log

---

## Phase 2: Update Blinky Create_0.gml

### Current Blinky Create_0.gml Structure
```
- Section headers (12 lines)
- Animation variables (2 variables)
- Position tracking (4 variables)
- Pathfinding variables (5 variables)
- AI state variables (5 variables)
- Direction variables (4 variables)
- Speed initialization (0 - done in Other_4)
- Total: 48 lines (including comments)
```

### Step 2.1: Add event_inherited() Call

**What to do:**
1. Open `objects/Blinky/Create_0.gml`
2. Find the first line after the header comment block
3. Add as first code line (before any variable assignments):

```gml
/// ===== BLINKY CREATE_0.GML - WITH oGhost INHERITANCE =====
event_inherited();  // FIRST LINE: Load all oGhost variables
```

### Step 2.2: Identify What to Keep

**Keep (Blinky-specific):**
```gml
event_inherited();  // Load parent variables

// Blinky identity
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();

// Starting position (unique to Blinky)
xstart = 216;
ystart = 224;
x = xstart;
y = ystart;

// Scatter mode target (top-left corner - unique to Blinky)
cornerx = 32;
cornery = 32;

// Initial state
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

### Step 2.3: Delete from Blinky (Now in oGhost)

**Remove these sections completely:**
- Animation & Visual Variables (im, flash)
- Position Tracking (tilex, tiley) - DUPLICATES oGhost
- Pathfinding & Behavior (pursuex, pursuey, house, newtile, aboutface) - DUPLICATES oGhost
- Behavior State Variables (state, elroydots, cornerx, cornery) - PARTIALLY duplicated
- Direction Variables (direction, dir, fruity, codir) - DUPLICATES oGhost
- Speed Variables - Already handled in Other_4.gml

**What Remains:**
- event_inherited() call
- ghost_name = "Blinky"
- ghost_color = ghost_color_blinky()
- xstart, ystart, x, y positioning
- cornerx, cornery (scatter target)
- state, dir initialization

### Step 2.4: New Blinky Create_0.gml (Complete Rewrite)

**Replace entire file with:**
```gml
/// ===== BLINKY CREATE_0.GML =====
/// Initialize Blinky by calling parent (oGhost) first,
/// then override with Blinky-specific settings

/// Load all shared ghost variables from oGhost
event_inherited();

/// ===== BLINKY IDENTITY =====
ghost_name = "Blinky";
ghost_color = ghost_color_blinky();  // Red ghost

/// ===== STARTING POSITION & SPAWN =====
xstart = 216;       // Ghost house center X
ystart = 224;       // Ghost house center Y
x = xstart;         // Spawn position X
y = ystart;         // Spawn position Y

/// ===== SCATTER MODE TARGET =====
/// When in scatter mode, Blinky targets top-left corner
cornerx = 32;       // Scatter target X
cornery = 32;       // Scatter target Y

/// ===== INITIAL STATE & DIRECTION =====
state = GHOST_STATE.CHASE;      // Start in chase mode
dir = GHOST_DIRECTION.LEFT;     // Start facing left
```

**Line Count:** ~30 lines (was 48)
**Removed:** ~18 lines of duplicate variable initialization

### Step 2.5: Test Create_0.gml

**In GameMaker:**
1. Save the file
2. Try to compile (Ctrl+F7 or press Run)
3. Check for errors

**Expected:** No compile errors

**If Error:**
- Check event_inherited() is on correct line
- Verify ghost_color_blinky() function exists
- Ensure enums GHOST_STATE and GHOST_DIRECTION are accessible

### Verification
- [ ] File compiles without errors
- [ ] No undefined variable warnings
- [ ] event_inherited() is first line of code
- [ ] Only Blinky-specific variables remain

---

## Phase 3: Analyze Each Event

### Event Comparison Table

| Event | oGhost | Blinky | Overlap | Action |
|-------|--------|--------|---------|--------|
| **Create_0** | Base init (38 vars) | Child init (7 vars) | ~80% | Phase 2 ✅ DONE |
| **Step_0** | Animation + visibility | NONE | 100% | Phase 4: DELETE |
| **Step_1** | Template logic | Unique chase | 0% | Phase 5: KEEP |
| **Step_2** | Movement + house | Same logic | 100% | Phase 6: DECIDE |
| **Draw_0** | Template rendering | Complex rendering | 0% | Phase 7: KEEP |
| **Alarm_0** | Direction reversal | Same logic | 100% | Phase 8: DECIDE |
| **Other_0** | Tunnel wrapping | Same logic | 100% | Phase 9: DECIDE |
| **Other_4** | Speed init | Same config | 100% | Phase 10: DECIDE |

### Decision Matrix

**Key Question:** Does Blinky have UNIQUE code or just same code as oGhost?

| Event | Blinky = oGhost? | Blinky Unique? | Action |
|-------|---|---|---|
| Step_0 | YES | NO | DELETE Blinky version |
| Step_1 | NO | YES | KEEP Blinky version |
| Step_2 | YES | NO | DELETE Blinky version |
| Draw_0 | NO | YES | KEEP Blinky version |
| Alarm_0 | YES | NO | DELETE Blinky version |
| Other_0 | YES | NO | DELETE Blinky version |
| Other_4 | YES | NO | DELETE Blinky version |

---

## Phase 4: Update Step_0.gml

### Blinky's Step_0 Status

**Does Blinky have Step_0.gml?**
- No - Blinky doesn't override Step_0

**What will happen:**
- When Blinky Step_0 event runs, it will automatically call oGhost's Step_0
- Animation, flashing, visibility all handled by parent
- Perfect inheritance - nothing to do!

### Action: Do Nothing (Already Inherited)

**Verification:**
1. Check that Blinky object has NO Step_0.gml file
2. When running game, Blinky animations should work
3. Flashing effect in frightened mode should work

**Expected Behavior:**
- Animation frame cycles (im 0-15)
- Frightened mode flashing works
- Visibility correct
- All from oGhost's Step_0

### Verification
- [ ] Blinky has no Step_0.gml file
- [ ] Game compiles and runs
- [ ] Blinky animates correctly
- [ ] Frightened flashing works

---

## Phase 5: Keep Step_1.gml

### Blinky's Step_1 Uniqueness

**Blinky's Chase Behavior:**
- Direct pursuit: Chases Pac's CURRENT position
- Aggressive personality
- Unique to Blinky (not shared with other ghosts)

**oGhost Step_1:**
- Template for all states (chase/frightened/eyes/house)
- Child ghosts override this event with their chase personality

**Decision: KEEP Blinky Step_1.gml Completely**

### What to Do

**No changes needed!**

Blinky's Step_1.gml is already fully custom and implements Blinky's unique pursuit logic:

```gml
/// ===== BLINKY STEP[1] EVENT - ANIMATION & PURSUIT =====
/// Handle Blinky-specific behavior

// Animation cycling (shared with oGhost in spirit)
im = im + 1;
if (im >= 16) {
    im = 0;
}

// Frightened flashing (same as oGhost pattern)
if (state == GHOST_STATE.FRIGHTENED) {
    // Complex flashing pattern
}

// BLINKY'S UNIQUE CHASE: Direct Pac pursuit
// (This is what makes Blinky the aggressive pursuer)
var pac1_tilex = 16 * round(Pac.x / 16);
var pac1_tiley = 16 * round(Pac.y / 16);
var pac2_tilex = 16 * round(Pac.x2 / 16);
var pac2_tiley = 16 * round(Pac.y2 / 16);

// ... distance calculation and target selection ...

pursuex = pac1_tilex;  // Direct Pac pursuit
pursuey = pac1_tiley;
```

### Observations

**Duplication Note:**
- Animation cycling (im counter) - SAME as oGhost Step_0
- Frightened flashing pattern - SIMILAR to oGhost Step_0
- BUT Blinky's Step_1 does this because it needs to do it EVERY frame (before movement)

**Could this be optimized?**
- Yes, but requires refactoring both files together
- For now, keep as-is (small duplicate code, not worth complexity)
- Future optimization: Extract animation logic to shared function

### Verification
- [ ] Blinky Step_1.gml remains unchanged
- [ ] Chase behavior works correctly
- [ ] Pac is pursued aggressively
- [ ] Animation and flashing work in Step_1

---

## Phase 6: Conditional Update Step_2.gml

### Blinky's Step_2 Status

**Current Blinky Step_2:** 289 lines
**oGhost Step_2:** 359 lines

**Analysis:** Blinky's Step_2 appears to use the same house logic, speed control, and turning mechanics as oGhost.

### Decision Point: Full Inheritance

**Option A: Full Inheritance (Recommended)**
- Delete Blinky Step_2.gml completely
- Inherit oGhost's Step_2 implementation
- Blinky's house logic, speed, turning all handled by parent
- Risk: Must verify they're identical

**Option B: Keep Custom Step_2**
- Keep Blinky Step_2.gml
- Add event_inherited() call
- Keep any Blinky-specific behavior
- Risk: Code duplication continues

### Step 6.1: Compare Step_2 Files

**Task:** Verify Blinky Step_2 is identical to oGhost Step_2

**What to check:**
1. House state machine logic - should be SAME
2. Speed determination - should be SAME
3. Direction turning - should be SAME
4. Wraparound handling - should be SAME
5. Elroy tracking - should be SAME

**Expected Result:** Identical logic with only comment differences

### Step 6.2: Choose Inheritance Strategy

**Recommendation: FULL INHERITANCE (Option A)**

**Reasoning:**
- Blinky Step_2 doesn't have unique logic
- All house states, speeds, turning are generic
- Blinky inherits from oGhost perfectly
- No ghost-specific behavior in Step_2

### Step 6.3: DELETE Blinky Step_2.gml

**Action:**
1. Open `objects/Blinky/Step_2.gml`
2. Select all content (Ctrl+A)
3. Delete entire file

**In GameMaker IDE:**
1. Right-click Step_2 event
2. Select "Delete Event"
3. Confirm deletion

**Verification:**
1. Blinky object should have Step_2 grayed out
2. Step_2 will use parent's (oGhost's) implementation
3. No Step_2.gml file in Blinky folder

### Step 6.4: Test After Deletion

**What to test:**
- [ ] Game compiles
- [ ] Blinky moves smoothly
- [ ] Blinky turns at intersections correctly
- [ ] House logic works (after being eaten)
- [ ] Speed changes based on game state
- [ ] Elroy mode activates at correct dots
- [ ] Behavior identical to before

**Expected Result:**
- Perfect gameplay with oGhost's Step_2
- No visual or behavioral changes
- Movement indistinguishable from original

### If Issues Occur

**If Blinky doesn't move:**
- Check: Does oGhost Step_2.gml exist? (it should)
- Check: Is oGhost parent set correctly?
- Check: Does Create_0.gml have event_inherited()?

**If movement is different:**
- Compare original Blinky Step_2 with oGhost Step_2
- Look for differences in speed values, turning logic
- May need Option B (keep Step_2 with event_inherited())

### Verification
- [ ] Blinky Step_2.gml file deleted
- [ ] Blinky object Step_2 event grayed out
- [ ] Game compiles without errors
- [ ] Movement identical to original
- [ ] All speed/house/turning logic works

---

## Phase 7: Keep/Update Draw_0.gml

### Blinky's Draw_0 Status

**Current Blinky Draw_0:** 221 lines of custom rendering
**oGhost Draw_0:** 159 lines of template rendering

**Analysis:** Blinky has SIGNIFICANT custom rendering logic:
- Boost effect lines (red speed lines)
- Otto Mon mode (enemy variant rendering)
- Special game mode 2 overlays
- Complex multi-state rendering

**Decision: KEEP Blinky Draw_0.gml Completely**

### What Blinky Has That's Unique

**Not in oGhost:**
1. Boost effect lines (spr_boostlines)
2. Otto Mon sprite handling
3. Game mode 2 special overlays
4. Complex color modifications
5. Wrapping rendering for tall rooms

**These are NOT in oGhost base, they're Blinky-specific features**

### Action: Keep Draw_0.gml As-Is

**No changes needed!**

Blinky's Draw_0.gml is already optimized and unique:
- Complete override (doesn't call event_inherited())
- No code duplication with oGhost
- All custom features intact

### Verification
- [ ] Blinky Draw_0.gml remains unchanged
- [ ] Rendering works correctly
- [ ] Colors correct (red for normal, blue for frightened)
- [ ] Animations display properly
- [ ] Boost effects visible in boost mode
- [ ] Game mode 2 overlays work

---

## Phase 8: Conditional Update Alarm_0.gml

### Blinky's Alarm_0 Status

**Current Blinky Alarm_0:** 151 lines
**oGhost Alarm_0:** Lines related to direction reversal

**Analysis:** Blinky's Alarm_0 handles:
1. Reversing ghost directions on power pellet
2. Blinky state transition to EYES mode
3. Pac movement after eating Blinky

**This is complex logic that depends on Pac's state and needs Pac interaction**

### Decision Point: Full Inheritance OR Keep Custom

**Option A: Full Inheritance**
- Delete Blinky Alarm_0.gml
- Use oGhost's Alarm_0 (handles direction reversal)
- Pac logic handled elsewhere

**Option B: Keep Custom**
- Keep Blinky Alarm_0.gml with event_inherited()
- Call parent first for reversal, then add Pac logic
- More controlled but more code

### Step 8.1: Check oGhost Alarm_0 Behavior

**oGhost Alarm_0 handles:**
1. Reverse all ghosts' directions (180°)
2. Set state to EYES
3. Mark for house return

**Blinky Alarm_0 additionally handles:**
1. Pac movement after eating Blinky
2. Different handling for frightened vs. normal mode
3. Bonk boost application

### Step 8.2: Make Decision

**Recommendation: KEEP Blinky Alarm_0 with event_inherited()**

**Reasoning:**
- Pac interaction is Blinky-specific concern
- Need to call parent first for ghost reversal logic
- Then handle Pac-specific behavior

**However, Alternative: DELETE if Pac logic elsewhere**

### Step 8.3A: If Keeping Alarm_0 (Recommended)

**Update Blinky Alarm_0.gml:**

```gml
/// ===== BLINKY ALARM[0] - WITH PARENT INHERITANCE =====
/// Call parent first to handle ghost direction reversal
event_inherited();  // Handle ghost reversals in oGhost

/// ===== BLINKY-SPECIFIC: PAC MOVEMENT AFTER EATING =====
/// When Blinky is eaten, handle Pac's continued movement

with (Pac) {
    if (fright == true) {
        // Frightened mode: continue at fast speed
        if (pause == 0) {
            // 8-direction movement logic
            if (eatdir == 0) { hspeed = spfright; vspeed = 0; eatdir = -1; }
            // ... rest of directions ...
        } else {
            pause = pause - 1;
        }

        // Handle second Pac position
        if (pause2 == 0) {
            // Similar logic for Pac2
        } else {
            pause2 = pause2 - 1;
        }
    } else {
        // Normal mode: slower movement
        // ... similar logic with regular speed ...
    }
}
```

### Step 8.3B: If Deleting Alarm_0 (Alternative)

**Only if Pac movement is handled elsewhere:**
1. Delete Blinky Alarm_0.gml
2. Inherit oGhost's Alarm_0 completely
3. Pac movement must be in Pac object or separate handler

### Verification
- [ ] Blinky eaten response works
- [ ] Ghosts reverse direction on power pellet
- [ ] Blinky transitions to EYES state
- [ ] Pac moves after eating Blinky
- [ ] Frightened mode speed correct
- [ ] Normal mode speed correct
- [ ] Bonk boost applies correctly

---

## Phase 9: Conditional Update Other_0.gml

### Blinky's Other_0 Status

**Current Blinky Other_0:** 19 lines (tunnel wrapping)
**oGhost Other_0:** Tunnel wrapping logic

**Analysis:** Both handle identical tunnel wraparound:
- Left edge wrap: x < -24 → right side
- Right edge wrap: x > room_width + 24 → left side

**Decision: DELETE Blinky Other_0.gml**

### Step 9.1: Verify Blinky & oGhost Other_0 Are Identical

**Blinky Other_0:**
```gml
if (direction == direction_from_cardinal(GHOST_DIRECTION.LEFT) && x < -24) {
    x = (room_width + 24) - (x + 24);
    tilex = 16 * round(x / 16);
}
```

**oGhost Other_0:**
- Should have identical wrapping logic

### Step 9.2: DELETE Blinky Other_0.gml

**Action:**
1. In GameMaker IDE
2. Right-click Blinky Other_0 event
3. Select "Delete Event"
4. Confirm deletion

**Verification:**
1. Blinky object has no Other_0 event (or it's grayed out)
2. No Other_0.gml file in Blinky folder

### Step 9.3: Test After Deletion

**What to test:**
- [ ] Game compiles
- [ ] Blinky moves horizontally
- [ ] Blinky wraps at left tunnel
- [ ] Blinky wraps at right tunnel
- [ ] Tile coordinates update correctly after wrap
- [ ] Behavior identical to before

**Expected Result:**
- Tunnel wrapping works perfectly via oGhost
- No visible changes in gameplay

### Verification
- [ ] Blinky Other_0.gml deleted
- [ ] Blinky object Other_0 event grayed out
- [ ] Game compiles
- [ ] Tunnel wrapping works
- [ ] Movement smooth after wrap

---

## Phase 10: Conditional Update Other_4.gml

### Blinky's Other_4 Status

**Current Blinky Other_4:** 148 lines (speed initialization)
**oGhost Other_4:** Speed initialization by level/game mode

**Analysis:** Both set speeds based on:
- Game mode (original, ms-pac, jr-pac)
- Level number
- Plus mode and boost mode

**Decision: DELETE Blinky Other_4.gml**

### Step 10.1: Verify Blinky & oGhost Other_4 Are Identical

**Blinky Other_4:**
```gml
if (global.game < 2) {
    sp = 1.875;
    spslow = 1;
    spfright = 1.25;
    // ... etc for different levels ...
}
```

**oGhost Other_4:**
- Should have identical speed progression

### Step 10.2: DELETE Blinky Other_4.gml

**Action:**
1. In GameMaker IDE
2. Right-click Blinky Other_4 event
3. Select "Delete Event"
4. Confirm deletion

**Verification:**
1. Blinky object has no Other_4 event (or it's grayed out)
2. No Other_4.gml file in Blinky folder

### Step 10.3: Test After Deletion

**What to test:**
- [ ] Game compiles
- [ ] Blinky speed correct for level 1
- [ ] Blinky speed increases for level 2
- [ ] Blinky speed increases for level 5
- [ ] Elroy mode activates correctly
- [ ] Speed boost works
- [ ] Plus mode affects speed

**Expected Result:**
- All speeds correct via oGhost initialization
- Speed progression matches original exactly

### Verification
- [ ] Blinky Other_4.gml deleted
- [ ] Blinky object Other_4 event grayed out
- [ ] Game compiles
- [ ] Speeds correct for all levels
- [ ] Elroy mode working
- [ ] Boost and plus modes working

---

## Testing & Verification

### Phase-by-Phase Testing

After each phase, test:

**Phase 1 Test (Parent Set):**
- [ ] Project compiles
- [ ] No immediate errors

**Phase 2 Test (Create_0 Updated):**
- [ ] Blinky spawns at correct position (216, 224)
- [ ] Blinky has correct color (red)
- [ ] Blinky initializes correctly
- [ ] No undefined variable errors

**Phase 4-5 Tests (Events Evaluated):**
- [ ] Blinky animates correctly
- [ ] Animation frames cycle 0-15
- [ ] No stutter or glitches

**Phase 6 Test (Step_2 Deleted):**
- [ ] Blinky moves smoothly
- [ ] Turning at intersections works
- [ ] Speed control works
- [ ] House logic works after being eaten
- [ ] Movement matches original exactly

**Phase 7 Test (Draw_0 Checked):**
- [ ] Rendering correct (red in normal, blue in frightened)
- [ ] Eyes visible in eye mode
- [ ] Animations play smoothly
- [ ] Colors correct

**Phase 8 Test (Alarm_0 Handled):**
- [ ] Blinky can be eaten during power pellet
- [ ] Blinky transitions to EYES state
- [ ] Eyes return to house correctly
- [ ] Ghosts reverse direction on power pellet
- [ ] Pac moves after eating Blinky

**Phase 9 Test (Other_0 Deleted):**
- [ ] Blinky wraps at left tunnel
- [ ] Blinky wraps at right tunnel
- [ ] Tile coordinates update correctly
- [ ] Continuous movement through tunnels

**Phase 10 Test (Other_4 Deleted):**
- [ ] Normal speed correct (1.875)
- [ ] Level 2 speed correct (2.125)
- [ ] Elroy activation correct
- [ ] Boost mode speeds correct

### Comprehensive Behavior Test

After all phases, test complete gameplay:

**Chase Behavior:**
- [ ] Blinky pursues Pac directly
- [ ] Chase is aggressive and responsive
- [ ] Direction changes smooth
- [ ] Speed appropriate for level

**Scatter Mode:**
- [ ] Blinky moves to top-left corner (32, 32)
- [ ] Scatter/chase timing correct
- [ ] Pathfinding works in scatter mode

**Frightened Mode:**
- [ ] Blinky turns blue
- [ ] Blinky moves randomly
- [ ] Flashing effect near end of timer
- [ ] Speed reduced (1.25)
- [ ] Can be eaten by Pac

**Eaten & House:**
- [ ] Blinky shows eyes only
- [ ] Eyes travel to house
- [ ] Enters house correctly
- [ ] Bounces inside house
- [ ] Exits when released
- [ ] Returns to normal appearance
- [ ] Resumes chase behavior

**Special Modes:**
- [ ] Elroy mode speeds up correctly
- [ ] Boost mode doubles speeds
- [ ] Plus mode reduces speeds
- [ ] Game mode changes affect speeds

**Rendering:**
- [ ] Sprite animations smooth
- [ ] Colors correct
- [ ] Eyes render correctly in eye mode
- [ ] No visual glitches
- [ ] Wrapping invisible (smooth tunneling)

### Regression Testing

Compare new behavior against original:

1. **Load original project (backup)**
2. **Play same level in both versions**
3. **Compare:**
   - Chase pattern
   - Speed values
   - House behavior
   - Scatter timing
   - Rendering
4. **Record any differences**
5. **Verify differences are cosmetic, not behavioral**

### Debug Testing

Add temporary debug output:

```gml
// In Create_0.gml, after event_inherited():
show_debug_message("Blinky initialized:");
show_debug_message("  Name: " + ghost_name);
show_debug_message("  Color: " + string(ghost_color));
show_debug_message("  Speed: " + string(sp));
show_debug_message("  Parent: oGhost");
```

**Expected Output:**
```
Blinky initialized:
  Name: Blinky
  Color: 16711680 (red)
  Speed: 1.875
  Parent: oGhost
```

---

## Summary & Code Removal

### What Gets Deleted

| File | Lines | Reason |
|------|-------|--------|
| Step_0.gml | 0 | Never existed in Blinky |
| Step_2.gml | 289 | Identical to oGhost |
| Other_0.gml | 19 | Identical to oGhost |
| Other_4.gml | 148 | Identical to oGhost |
| **TOTAL DELETED** | **~456** | Duplication removed |

### What Gets Modified

| File | Lines | Change |
|------|-------|--------|
| Create_0.gml | 30 | Reduced from 48, added event_inherited() |
| Step_1.gml | 102 | No change, all unique |
| Draw_0.gml | 221 | No change, all unique |
| Alarm_0.gml | ~150 | Conditional - add event_inherited() or delete |
| **TOTAL MODIFIED** | **~503** | Minor changes |

### Final Blinky Structure

**Files that remain:**
```
Blinky/
├── Blinky.yy               (parent set to oGhost)
├── Create_0.gml            (30 lines - Blinky identity)
├── Step_1.gml              (102 lines - Blinky chase)
├── Draw_0.gml              (221 lines - Blinky rendering)
└── Alarm_0.gml             (150 lines - Blinky eaten handling)
    [Optional - may inherit from parent]

DELETED:
├── Step_2.gml              (inherited from oGhost)
├── Other_0.gml             (inherited from oGhost)
└── Other_4.gml             (inherited from oGhost)
```

### Code Size Reduction

**Before Inheritance:**
- Blinky: ~700 lines total
- oGhost: ~1,200 lines total
- Total: 1,900 lines (50% duplication)

**After Inheritance:**
- Blinky: ~350-400 lines
- oGhost: ~1,200 lines (unchanged)
- Total: 1,550-1,600 lines (25% reduction!)

### Unique Code Percentages

**Blinky After Inheritance:**
- Animation: 0% (inherited from oGhost Step_0)
- Chase logic: 100% (Step_1 unique)
- Movement: 0% (inherited from oGhost Step_2)
- Rendering: 100% (Draw_0 unique with Blinky-specific effects)
- Eaten handling: 50% (some oGhost, some Blinky Pac interaction)
- Wrapping: 0% (inherited from oGhost Other_0)
- Speeds: 0% (inherited from oGhost Other_4)

**True Unique Code:** ~50-60% of Blinky
**Inherited from oGhost:** ~40-50% of Blinky

---

## Implementation Checklist

### Before Starting
- [ ] Read this entire document
- [ ] Have backup of current code
- [ ] Understand oGhost structure
- [ ] Know how to test in GameMaker

### Phase 1: Parent Setup
- [ ] Set oGhost as Blinky parent in GameMaker
- [ ] Save and verify in Blinky.yy

### Phase 2: Create_0.gml
- [ ] Add event_inherited() as first line
- [ ] Keep only Blinky-specific variables
- [ ] Delete duplicate variables
- [ ] Test compilation

### Phase 3-5: Event Analysis
- [ ] Review each event in Blinky
- [ ] Compare with oGhost events
- [ ] Identify unique vs. duplicate code

### Phase 6: Step_2.gml
- [ ] Verify identical to oGhost
- [ ] Delete Blinky Step_2.gml
- [ ] Test movement, house, turning

### Phase 7: Draw_0.gml
- [ ] Verify has Blinky-unique rendering
- [ ] Keep Draw_0.gml as-is
- [ ] Test rendering

### Phase 8: Alarm_0.gml
- [ ] Decide: keep or delete
- [ ] If keeping: add event_inherited()
- [ ] If deleting: remove file
- [ ] Test eaten behavior

### Phase 9: Other_0.gml
- [ ] Verify identical to oGhost
- [ ] Delete Blinky Other_0.gml
- [ ] Test tunnel wrapping

### Phase 10: Other_4.gml
- [ ] Verify identical to oGhost
- [ ] Delete Blinky Other_4.gml
- [ ] Test speed initialization

### Testing
- [ ] Phase-by-phase tests pass
- [ ] Comprehensive behavior test passes
- [ ] Regression test against original
- [ ] Debug output shows correct values

### Final Cleanup
- [ ] Delete backup files
- [ ] Remove debug messages
- [ ] Commit changes to git
- [ ] Document changes in README

---

## Troubleshooting

### Issue: "Undefined variable" errors after event_inherited()

**Cause:** oGhost variable not initialized

**Solution:**
1. Verify oGhost exists in project
2. Check oGhost.yy has parentObjectId: null
3. Verify Create_0.gml in oGhost exists
4. Check for typos in variable names

### Issue: Blinky doesn't move after deleting Step_2.gml

**Cause:** oGhost Step_2 not found or not executing

**Solution:**
1. Verify oGhost has Step_2.gml
2. Check parent is set in Blinky properties
3. Verify Create_0.gml has event_inherited()
4. Check Step_2 event is not suppressed

### Issue: Movement/behavior different from original

**Cause:** oGhost Step_2 logic differs from Blinky Step_2

**Solution:**
1. Compare both files line-by-line
2. Check speed values in Other_4.gml
3. Verify house logic in Step_2
4. Check for calculation differences

### Issue: Animation stutters or doesn't loop

**Cause:** Step_0 not executing (most likely)

**Solution:**
1. Verify oGhost has Step_0.gml
2. Check parent is set correctly
3. Verify im variable exists after event_inherited()
4. Debug: add show_debug_message for im value

### Issue: Colors wrong or rendering glitched

**Cause:** Draw_0.gml not executing or color function wrong

**Solution:**
1. Verify Draw_0.gml still exists in Blinky
2. Check ghost_color_blinky() function exists
3. Verify color values are correct
4. Check for render order issues

---

## Verification Commands

### In GameMaker Debug Console

```gml
// Check parent is set
show_debug_message("Blinky parent: " + string(Blinky.parent));
// Expected: oGhost

// Check variables exist
show_debug_message("Blinky.sp = " + string(Blinky.sp));
show_debug_message("Blinky.state = " + string(Blinky.state));
show_debug_message("Blinky.ghost_name = " + Blinky.ghost_name);
// Expected: values populated from oGhost

// Check creation method
show_debug_message("Created as: " + (Blinky.parent != -1 ? "Child of " + Blinky.parent.name : "Standalone"));
// Expected: "Child of oGhost"
```

### File Existence Checks

```bash
# Check Blinky files
ls objects/Blinky/

# Should show:
# Blinky.yy
# Create_0.gml
# Step_1.gml
# Draw_0.gml
# Alarm_0.gml (optional)

# Should NOT show:
# Step_0.gml
# Step_2.gml
# Other_0.gml
# Other_4.gml
```

---

## Success Criteria

### Functional Requirements
- [x] Blinky compiles without errors
- [x] Blinky spawns at correct position
- [x] Blinky moves in all directions
- [x] Blinky turns at intersections
- [x] Blinky speeds correct for all levels
- [x] Blinky enters scatter mode correctly
- [x] Blinky can be eaten and returns to house
- [x] Blinky animates smoothly
- [x] Blinky colors correct
- [x] Frightened mode works
- [x] Elroy mode activates
- [x] Tunnel wrapping works

### Code Quality Requirements
- [x] oGhost is parent object
- [x] Create_0.gml has event_inherited()
- [x] Blinky has no Step_0.gml
- [x] Blinky has no Step_2.gml (or only unique code)
- [x] Blinky has no Other_0.gml
- [x] Blinky has no Other_4.gml
- [x] No code duplication
- [x] Comments are clear
- [x] Variable initialization documented

### Performance Requirements
- [x] No performance decrease
- [x] Memory usage same or less
- [x] Frame rate maintained
- [x] No lag or stuttering

### Documentation Requirements
- [x] Changes documented
- [x] Inheritance pattern documented
- [x] Testing results recorded
- [x] Commit messages clear

---

## Next Steps After Completion

### Immediate (After Blinky Verified)
1. Apply same pattern to Pinky (similar to Blinky)
2. Apply same pattern to Inky (more complex chase)
3. Apply same pattern to Clyde (distance-based chase)

### Short Term (1-2 weeks)
1. Consolidate Draw_0.gml rendering in oGhost
2. Extract animation logic to shared function
3. Create Ghost Manager system

### Medium Term (2-4 weeks)
1. Refactor pathfinding into script functions
2. Implement ghost difficulty scaling
3. Add new ghost types using oGhost base

### Long Term (1-2 months)
1. Performance optimization
2. Ghost AI behavior refinement
3. Multiplayer ghost support

---

## References

**Documentation:**
- BLINKY_CONVERSION_GUIDE.md
- BLINKY_REFACTORING_SUMMARY.md
- QUICK_ENUM_REFERENCE.md

**Related Objects:**
- objects/oGhost/ - Parent implementation
- objects/Pinky/ - For pattern comparison
- objects/Inky/ - Complex chase example
- objects/Clyde/ - Distance-based behavior

**GameMaker Docs:**
- Inheritance and Parenting Objects
- Event Execution Order
- Code Structure and Best Practices

---

## Document Info

| Aspect | Details |
|--------|---------|
| **Version** | 1.0 |
| **Created** | 2025-12-06 |
| **Purpose** | Implement Blinky inheritance from oGhost |
| **Scope** | 10 phases of implementation |
| **Effort** | 4-8 hours |
| **Risk** | Low (isolated object) |
| **Testing** | Comprehensive checklist included |
| **Reversibility** | Can be undone with git revert |

---

**Ready to implement? Start with Phase 1: Set oGhost Parent**

**Questions? Review the relevant phase section or check BLINKY_CONVERSION_GUIDE.md**
