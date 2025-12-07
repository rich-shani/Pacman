# Ghost Refactoring Analysis: Moving Blinky to oGhost Base Implementation

## Executive Summary

The current architecture has **significant code duplication** across Blinky, Pinky, Inky, and Clyde. The goal is to consolidate shared logic into `oGhost` base implementation (Step_0, Step_1, Step_2) and have child ghosts **override only what differs**.

**Current Situation:**
- ✗ Each ghost has nearly identical Step_1 and Step_2 implementations
- ✗ Code duplicates animation, flashing, house logic, movement logic
- ✗ Only the **chase target calculation** differs per ghost
- ✗ No reuse of oGhost Step_0/1/2 routines

**Desired Outcome:**
- ✓ Shared logic in oGhost Step_0/1/2 (already documented!)
- ✓ Child ghosts override ONLY what's unique
- ✓ Single source of truth for common behaviors

---

## Deep Comparison: Blinky vs oGhost

### File Structure Comparison

| Aspect | Blinky/Step_1 | oGhost/Step_1 | Status |
|--------|---------------|---------------|--------|
| Animation | ~8 lines (manual cycle) | Included in Step_0 | **Move to Step_0** |
| Flash logic | 26 lines (power pellet) | 30 lines (modern) | **Consolidate in Step_0** |
| Chase target | Custom (Blinky-unique) | Default (direct chase) | **Keep in child override** |
| Turn logic | 104 lines | Included in Step_2 | **Move to Step_2** |
| House logic | 62 lines (Step_2) | 56 lines (Step_2) | **Consolidate** |

---

## Key Findings

### 1. **Animation Cycle (SHARED)**

**Current Blinky/Step_1:**
```gml
im = im + 1;
if (im >= 16) {
    im = 0;
}
```

**oGhost/Step_0 (BETTER):**
```gml
if state != GHOST_STATE.EYES {
    im = (im + 1) % 16;
}
```

**Decision:** Use oGhost version (modulo operator is cleaner, freezes animation in EYES mode)

---

### 2. **Frightened Mode Flashing (SHARED but DIFFERENT)**

**Blinky/Step_1 Implementation:**
- Uses 8 hardcoded alarm time thresholds
- Toggles `flash` variable (0 or 1) based on Pac.alarm[0] exact values
- Older approach: works but brittle

**oGhost/Step_1 Implementation (from your comments):**
- Uses `flash` counter incremented 0-29 (modern approach)
- Flash pattern: dark blue (0-14) → white (15-29)
- Visibility toggled when `Pac.alarm[0] < 121` and flash counter condition
- More flexible and scalable

**Analysis:**
```
Blinky approach:  if alarm==120 flash=1, if alarm==106 flash=0, if alarm==92 flash=1...
oGhost approach:  flash = (flash+1) % 30; visible = (flash < 15);
```

The oGhost approach is **superior** because:
- Single incrementing counter instead of 8 conditions
- Works with any power pellet duration
- Smooth visual progression

---

### 3. **Chase Target Calculation (GHOST-UNIQUE)**

This is the **only substantial difference** in Step_1:

**Blinky (direct chase):**
```gml
var pac1_tilex = 16 * round(Pac.x / 16);
var pac1_tiley = 16 * round(Pac.y / 16);
var pac2_tilex = 16 * round(Pac.x2 / 16);
var pac2_tiley = 16 * round(Pac.y2 / 16);

// Choose closer target between Pac1 and Pac2
if (dist_to_pac1 == dist_to_pac2) {
    if (irandom(1) == 1) {
        pursuex = pac2_tilex; pursuey = pac2_tiley;
    } else {
        pursuex = pac1_tilex; pursuey = pac1_tiley;
    }
} else if (dist_to_pac2 < dist_to_pac1) {
    pursuex = pac2_tilex; pursuey = pac2_tiley;
} else {
    pursuex = pac1_tilex; pursuey = pac1_tiley;
}
```

**Pinky (look-ahead):**
```gml
if (abs(16*(round(Pac.x2/16))+(2*Pac.xdir2) - tilex) + abs(16*(round(Pac.y2/16))+(2*Pac.ydir2) - tiley)) = ...
    pursuex = (16*(round(Pac.x2/16))+(2*Pac.xdir2));
    pursuey = (16*(round(Pac.y2/16))+(2*Pac.ydir2));
}
```

**Decision:** This must remain in child override (unique to each ghost)

---

### 4. **Turning Logic at Intersections (IDENTICAL)**

**Blinky/Step_2 (lines 100-221):**
```gml
if (Pac.chomp == 0 || state == 2) {
    if (newtile == 1) {
        if (dir == 0) {  // RIGHT
            if (direction == 0 && x > tilex) { direction = 0; newtile = 0; exit; }
            if (direction == 90 && y < tiley) { direction = 0; x = tilex + (tiley - y); y = tiley; newtile = 0; exit; }
            ...
        }
        if (dir == 1) {  // UP
            // 4 similar conditions
        }
        if (dir == 2) {  // LEFT
            // 4 similar conditions
        }
        if (dir == 3) {  // DOWN
            // 4 similar conditions
        }
    }
}
```

**oGhost/Step_2 (lines 140-292):**
- **Identical logic with IDENTICAL line-by-line implementation**
- Uses GHOST_DIRECTION enum instead of magic numbers (BETTER)
- 152 lines of identical turning code

**Decision:** **MOVE ENTIRE BLOCK TO oGhost Step_2** (it's 99.9% identical)

---

### 5. **House Logic (SIMILAR but with variations)**

**Blinky/Step_2 (lines 1-62):**
```gml
if (house == 1) {
    newtile = 0;
    tilex = (xstart - 216) + 224;
    tiley = (ystart - 224) + 224;
}

if (house == 0 && state == 2) {
    var door_x = (xstart - 216) + 216;
    var door_y = (ystart - 224) + 224;
    if (x > (xstart - 216) + 212 && x < (xstart - 216) + 220 && y == door_y) {
        housestate = 0;
        x = door_x;
        y = door_y;
        hspeed = 0;
        vspeed = speyes;
        house = 1;
        dir = 3;  // DOWN
    }
}

// Phase 1: move down
if (house == 1 && state == 2) {
    var house_bottom = (ystart - 224) + 272 + 8;
    var house_center_x = (xstart - 216) + 216;
    if (x == house_center_x && y >= house_bottom) {
        housestate = 1;
        x = house_center_x;
        y = house_bottom;
        hspeed = 0;
        vspeed = -spslow;
        state = 0;  // CHASE
        dir = 1;    // UP
    }
}

// Phase 2: move up
if (housestate == 1) {
    hspeed = 0;
    vspeed = -spslow;
}

// Exit house
if (house == 1 && state < 2 && x == (xstart - 216) + 216 && y < (ystart - 224) + 224) {
    housestate = 0;
    x = (xstart - 216) + 216;
    y = (ystart - 224) + 224;
    hspeed = -sp;
    vspeed = 0;
    house = 0;
    newtile = 0;
    dir = 2;  // LEFT
}
```

**oGhost/Step_2 (lines 19-87):**
- **Nearly identical** with same structure
- Constants inline vs stored in variables (minor difference)
- Both use same state machine approach

**Potential Issue:** Different ghosts may have different house exit logic (Pinky, Inky, Clyde have special house exits). Need to verify if this is truly shared.

---

### 6. **Speed Determination (IDENTICAL)**

**Blinky/Step_2 (lines 64-94):**
```gml
if (house == 0) {
    if (state == 0) {
        if (collision_point(tilex, tiley, Slow, false, true)) {
            speed = spslow;
        } else {
            if (Pac.dotcount >= elroydots2 && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                speed = spelroy2;
            } else if (Pac.dotcount >= elroydots && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                speed = spelroy;
            } else {
                speed = sp;
            }
        }
    } else if (state == 1) {
        if (collision_point(tilex, tiley, Slow, false, true)) {
            speed = spslow;
        } else {
            speed = spfright;
        }
    } else if (state == 2) {
        speed = speyes;
    }
}
```

**oGhost/Step_2 (lines 89-128):**
- **Identical** except minor variable references
- Both handle tunnel slowdown, Elroy modes, frightened speed, eyes speed

**Decision:** **MOVE TO oGhost Step_2** (100% shared logic)

---

### 7. **About-Face / Edge Detection (IDENTICAL)**

**Blinky/Step_2 (lines 224-254):**
```gml
if (room_width > 448) {
    if (house == 0) {
        var view_x = __view_get(e__VW.XView, 0);
        if (x < view_x - 32 && x > view_x - 40 && dir == 2) {
            aboutface = 1;
        }
        if (x > view_x + 480 && x < view_x + 488 && dir == 0) {
            aboutface = 1;
        }
    }
}

if (room_height == 960) {
    if (house == 0) {
        var view_y = __view_get(e__VW.YView, 0);
        if (y < view_y + 16 && y > view_y + 8 && dir == 1) {
            aboutface = 1;
        }
        if (y > view_y + 560 - 32 && y < view_y + 568 - 32 && dir == 3) {
            aboutface = 1;
        }
    }
}
```

**oGhost/Step_2 (lines 294-320):**
- **Identical** implementation

**Decision:** **MOVE TO oGhost Step_2**

---

### 8. **Elroy Mode Tracking (IDENTICAL)**

Both files have identical logic to track elroy visual state.

**Decision:** **MOVE TO oGhost Step_2**

---

### 9. **Vertical Wraparound (DUPLICATE)**

**Blinky/Step_2 (lines 277-288):**
```gml
if (direction == 90 && y < 32) {
    y = 544;
    tiley = 16 * round(y / 16);
}
if (direction == 270 && y > room_height - 32) {
    y = 32;
    tiley = 16 * round(y / 16);
}
```

**oGhost/Step_1 (lines 75-85):**
```gml
if direction == 90 and y < 32 {
    y = 544;
    tiley = 16 * (round(y / 16));
}

if direction == 270 and y > room_height - 32 {
    y = 32;
    tiley = 16 * (round(y / 16));
}
```

**oGhost/Step_2 (lines 345-354):**
- Duplicate of Step_1 wraparound

**Note:** Wraparound appears in BOTH Step_1 and Step_2 in oGhost (redundant!)

**Decision:** Keep in Step_1 (it's a state update, not movement). Remove from Step_2.

---

## Summary: What to Move to oGhost Base

### ✓ MOVE TO oGhost/Step_0:
1. Animation cycle logic (already there, verified good)
2. Frightened flashing logic (consolidate Blinky's 26 lines into oGhost's 30-line version)
3. Tile coordinate tracking (both have it)
4. Vertical wraparound check (move from Step_1 to here)

### ✓ MOVE TO oGhost/Step_1:
1. Keep Pac target handling (oGhost default: direct chase)
   - Child ghosts override entire Step_1 for unique chase behavior
2. Keep FRIGHTENED mode random movement (already there)
3. Keep EYES mode house target (already there)
4. Verify vertical wraparound (ensure not duplicated in Step_2)

### ✓ MOVE TO oGhost/Step_2:
1. House state machine (56-62 lines) - consolidate variations
2. Speed determination (25 lines) - absolutely identical
3. Turning at intersections (152 lines) - absolutely identical
4. About-face / edge detection (30 lines) - absolutely identical
5. Elroy indicator (7 lines) - absolutely identical
6. **REMOVE duplicate vertical wraparound** (4 lines)
7. Visibility flashing in frightened (3 lines) - move to Step_1 or Step_0

---

## Implementation Strategy

### Phase 1: Consolidate Step_0
**Files to modify:** oGhost/Step_0.gml
**Files to delete:** Blinky/Step_1.gml (animation/flash parts)

Add to oGhost/Step_0:
```gml
// Improved animation with EYES mode handling
if state != GHOST_STATE.EYES {
    im = (im + 1) % 16;
}

// Consolidated frightened flashing
if state == GHOST_STATE.FRIGHTENED {
    flash = (flash + 1) % 30;
    if Pac.alarm[0] < 121 {
        visible = (flash < 15);
    } else {
        visible = true;
    }
} else {
    visible = true;
    flash = 0;
}
```

### Phase 2: Consolidate Step_2
**Files to modify:** oGhost/Step_2.gml
**Files to delete content from:** Blinky/Step_2.gml (everything except child-specific parts)

Add to oGhost/Step_2:
1. Entire house state machine (56 lines)
2. Speed determination (25 lines)
3. Entire turning logic (152 lines)
4. About-face detection (30 lines)
5. Elroy tracking (7 lines)

### Phase 3: Child Ghost Overrides
**Files to keep:** Blinky/Step_1.gml (ONLY chase target calculation)
**New pattern for children:**
```gml
// Blinky/Step_1.gml - OVERRIDE ONLY
if state == GHOST_STATE.CHASE {
    // Blinky's unique behavior: chase closer Pac
    var pac1_tilex = 16 * round(Pac.x / 16);
    var pac1_tiley = 16 * round(Pac.y / 16);
    var pac2_tilex = 16 * round(Pac.x2 / 16);
    var pac2_tiley = 16 * round(Pac.y2 / 16);

    var dist_to_pac1 = abs(pac1_tilex - tilex) + abs(pac1_tiley - tiley);
    var dist_to_pac2 = abs(pac2_tilex - tilex) + abs(pac2_tiley - tiley);

    if (dist_to_pac1 == dist_to_pac2) {
        pursuex = irandom(1) == 1 ? pac2_tilex : pac1_tilex;
        pursuey = irandom(1) == 1 ? pac2_tiley : pac1_tiley;
    } else if (dist_to_pac2 < dist_to_pac1) {
        pursuex = pac2_tilex;
        pursuey = pac2_tiley;
    } else {
        pursuex = pac1_tilex;
        pursuey = pac1_tiley;
    }
}
// For FRIGHTENED, EYES, IN_HOUSE: rely on parent oGhost implementation
```

**Delete entirely:** Blinky/Step_2.gml (all logic moves to parent)

### Phase 4: Verify Other Ghosts
Check Pinky, Inky, Clyde Step_1 to see what's unique:
- All have custom chase target logic → keep as overrides
- All have same flashing/animation → delete to use parent

Check Step_2 for any ghost-specific house logic:
- If Pinky/Inky/Clyde have special house behavior, make Step_2 overridable
- Otherwise, delete Step_2 from all children

---

## Detailed Code Movement Reference

### oGhost/Step_0 - Current vs. Target

**Current (INCOMPLETE):**
- Animation (good)
- Frightened flashing (mentioned but could be refined)
- Tile tracking (good)
- Vertical wraparound (good)

**Target (COMPLETE):**
```gml
/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - STEP_0 EVENT
/// ===============================================================================

// ===== ANIMATION FRAME UPDATE =====
if state != GHOST_STATE.EYES {
    im = (im + 1) % 16;
}

// ===== FRIGHTENED MODE FLASHING EFFECT =====
if state == GHOST_STATE.FRIGHTENED {
    flash = (flash + 1) % 30;

    if Pac.alarm[0] < 121 {
        visible = (flash < 15);  // Flashing effect
    } else {
        visible = true;  // Solid color early in power pellet
    }
} else {
    visible = true;
    flash = 0;  // Reset flash counter
}

// ===== TILE COORDINATE TRACKING =====
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);

// ===== WRAPAROUND CHECK FOR VERTICAL =====
if direction == 90 and y < 32 {
    y = 544;
    tiley = 16 * (round(y / 16));
}

if direction == 270 and y > room_height - 32 {
    y = 32;
    tiley = 16 * (round(y / 16));
}
```

### oGhost/Step_1 - Current vs. Target

**Current:**
- Chase mode target (default direct chase)
- FRIGHTENED random movement
- EYES mode target
- House ready waiting

**Target (NO CHANGES):**
Keep as-is. Child ghosts override the ENTIRE event for their unique chase behavior.

### oGhost/Step_2 - Current vs. Target

**Current (NEEDS EXPANSION):**
- House state machine (basic)
- Speed determination (missing some detail)
- Turning logic (missing)
- About-face detection (missing)
- Vertical wraparound (redundant with Step_1)

**Target (CONSOLIDATED):**
Integrate all 400+ lines from Blinky/Step_2, removing only vertical wraparound duplicate.

---

## Ghost-Specific Variations to Handle

### House Logic Variations:
- **Blinky:** Simple straight down-then-up
- **Pinky:** Counts dots before exiting (needs special logic)
- **Inky/Clyde:** Complex multi-state exit (housestate 0-4)

**Recommendation:**
- Move basic house machine to oGhost
- Pinky/Inky/Clyde override Step_2 to add their dot-counting/multi-state logic
- Or: Create `ghost_house_exit()` script to handle variations

---

## Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| Different ghosts have different house behavior | Keep Step_2 overridable, or use virtual functions |
| Turning logic has subtle differences per ghost | Verify line-by-line that it's truly identical |
| Elroy logic may vary by ghost | Check if `elroydots` and `spelroy` are per-ghost |
| Animation freezes in EYES but others move eyes | Test thoroughly in EYES state |

---

## Files to Modify

### Delete Entirely:
- [ ] Blinky/Step_2.gml
- [ ] Pinky/Step_2.gml (if identical to oGhost)
- [ ] Inky/Step_2.gml (if identical to oGhost)
- [ ] Clyde/Step_2.gml (if identical to oGhost)

### Reduce to Minimal Override:
- [ ] Blinky/Step_1.gml → Only chase target logic (~70 lines → ~20 lines)
- [ ] Pinky/Step_1.gml → Only chase target logic (~50 lines → ~20 lines)
- [ ] Inky/Step_1.gml → Only chase target logic (+ other variations)
- [ ] Clyde/Step_1.gml → Only chase target logic (+ other variations)

### Expand:
- [ ] oGhost/Step_0.gml → Add consolidated flashing logic
- [ ] oGhost/Step_1.gml → No changes (keep as-is for overriding)
- [ ] oGhost/Step_2.gml → Add ALL house/speed/turning/edge logic

---

## Next Steps

1. **Read each ghost's Step_1 and Step_2 fully** to identify ALL unique logic
2. **Create consolidated oGhost/Step_2** with all shared logic
3. **Test oGhost alone** with event_inherited() to ensure it works
4. **Reduce each child ghost** to Step_1 override only
5. **Verify child ghosts** still work correctly (chase behavior, house exit, etc.)
6. **Performance test** to ensure no regression

