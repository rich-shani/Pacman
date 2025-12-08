# Pac-Man Object Refactoring Guide

## Overview

The Pac object is the most complex object in the game, handling Player 1 movement, collision detection, ghost eating, dot collection, and game state management. This guide provides a comprehensive refactoring strategy to improve code clarity, maintainability, and consistency.

---

## Current Issues

### Code Quality Problems

1. **Magic Numbers**: Frequent use of numeric state values (0, 1, 2, 3) instead of enums
2. **Poor Formatting**: Inconsistent indentation and spacing
3. **Minimal Comments**: Complex logic lacks explanation
4. **Code Duplication**: Same pattern repeated for 4 ghosts
5. **Nested Conditions**: Deep nesting (8+ levels) reduces readability
6. **Long Events**: Step_1.gml and Step_2.gml exceed 1000 lines each
7. **Unclear Variable Names**: Variables like `siren`, `bonked`, `chomp` lack context
8. **Mixed Concerns**: Movement, collision, scoring all in single events

---

## Refactoring Strategy

### Phase 1: Enum & Constant Replacement

Replace numeric values with meaningful enums:

```gml
// BEFORE
if state == 0 { /* chase */ }
else if state == 1 { /* frightened */ }
else if state == 2 { /* eyes */ }

// AFTER
if state == GHOST_STATE.CHASE { /* chase */ }
else if state == GHOST_STATE.FRIGHTENED { /* frightened */ }
else if state == GHOST_STATE.EYES { /* eyes */ }
```

**Priority Actions:**
- Replace `fright = 0/1` with `fright_state` enum
- Replace `dead = 0/1/2/3` with `PAC_STATE` enum
- Replace `dir = 0/1/2/3` with `DIRECTION` enum
- Define speed constants (`SP_NORMAL`, `SP_FRIGHT`)
- Define siren levels (`SIREN_0` through `SIREN_4`)

**Files to Update:**
- Create_0.gml (add enum definitions)
- Step_0.gml (update state comparisons)
- Step_1.gml (update state comparisons & replace ghost eating logic)
- Step_2.gml (update all state comparisons & speed logic)
- All Alarm_*.gml events (update state management)

### Phase 2: Code Organization & Formatting

#### Create_0.gml

**Current Structure:**
- Raw variable initialization (157 lines)

**Proposed Structure:**
```gml
/// ===============================================================================
/// PAC-MAN OBJECT - CREATE EVENT
/// ===============================================================================

// ===== SECTION 1: PLAYER MOVEMENT VARIABLES =====
/// Formatted with clear comments for each variable group

// ===== SECTION 2: POWER PELLET (FRIGHT) VARIABLES =====
/// Grouped related mechanics

// ===== SECTION 3: GAME STATE VARIABLES =====
/// Death, level start, finish tracking

// ... etc

// ===== SUPPORTING OBJECT CREATION =====
/// Scroller, Drawless, Mac objects
```

**Key Improvements:**
- Add context comments before each variable section
- Explain default values and ranges
- Document relationships between variables
- Show where variables are modified (reference file names)

#### Step_0.gml

**Current:** 27 lines, minimal comments
**Issue:** Mixes direction-setting with other logic
**Action:**
- Add comprehensive header explaining each direction block
- Add comments explaining the ghost eating interaction
- Document why certain ghosts are excluded from direction updates

```gml
/// ===============================================================================
/// PAC STEP_0 - DIRECTION SYNCHRONIZATION & MOVEMENT PREPARATION
/// ===============================================================================
/// This event synchronizes Pac's visual direction (dir) with actual movement
/// based on hspeed/vspeed values set in previous events
///
/// Called FIRST each frame (before input handling in Step_1)
/// Updates: dir variable for rendering & pathfinding
```

#### Step_1.gml (THE BIG ONE - 1000+ lines)

**Current Issues:**
- Massive nested if statements
- No clear section breaks
- Ghost collision code repeated 4x
- Complex corner mechanics unexplained

**Proposed Reorganization:**

```gml
/// ===============================================================================
/// PAC STEP_1 - INPUT, MOVEMENT, & GHOST COLLISION HANDLING
/// ===============================================================================
///
/// Main Responsibilities:
/// 1. Handle keyboard input & movement direction changes
/// 2. Process corner/turn mechanics for smooth movement
/// 3. Detect and handle dot collection
/// 4. Detect and handle power pellet collection
/// 5. Detect ghost collisions (4 separate routines)
/// 6. Handle level completion (all dots eaten)
/// 7. Manage audio (siren thresholds, ghost states)
///
/// Events Processed:
/// - Keyboard input checks (arrow keys)
/// - Collision detection (ghosts, dots, power pellets, fruit)
/// - Game state transitions (finishing level, being eaten)
///
/// ===============================================================================

// ===== SECTION 1: KEYBOARD INPUT & DIRECTION CHANGE =====
/// Handle arrow key input and apply movement
/// Uses "corner" mechanic for smooth turning when input arrives

// ===== SECTION 2: DOT COLLECTION =====
/// Check collision with Dot instances
/// Increase score, play sound, manage dot counter

// ===== SECTION 3: POWER PELLET HANDLING =====
/// Check collision with Power instance
/// Activate fright mode, set timers, reverse ghosts

// ===== SECTION 4: FRUIT COLLECTION (IF APPLICABLE) =====
/// Check collision with Fruit instance
/// Award bonus points, play sound

// ===== SECTION 5: GHOST COLLISION DETECTION =====
/// Check collision with each ghost individually
/// Handle both eating (in fright) and being eaten
/// Trigger death sequence or chomp animation

// ===== SECTION 6: LEVEL COMPLETION CHECK =====
/// Check if all dots have been collected
/// Trigger level finish sequence

// ===== SECTION 7: AUDIO/AMBIENCE MANAGEMENT =====
/// Play background siren based on dot count
/// Play frightened/chase music based on ghost states
/// Handle game over state audio
```

**Refactoring Steps:**

1. **Extract Ghost Collision into Script:**
   ```gml
   // Create: scripts/handle_ghost_collision/handle_ghost_collision.gml
   /// Handles collision with a single ghost
   /// Returns true if Pac was eaten, false if Pac ate ghost
   function handle_ghost_collision(ghost_instance) {
       // Position check logic
       // State check logic (fright vs chase)
       // Animation/death setup
       // Score management
       // Return result
   }
   ```

2. **Extract Input Handling into Script:**
   ```gml
   // Create: scripts/handle_pac_input/handle_pac_input.gml
   /// Handle keyboard input and movement direction changes
   /// Manages corner mechanics for smooth turning
   function handle_pac_input() {
       // Right arrow handling
       // Up arrow handling
       // Left arrow handling
       // Down arrow handling
       // Corner processing logic
   }
   ```

3. **Extract Audio Management into Script:**
   ```gml
   // Create: scripts/update_ambience/update_ambience.gml
   /// Manage background audio based on game state
   /// - Siren changes (ghost distance)
   /// - Frightened mode music
   /// - Eyes/chase mode
   function update_ambience() {
       // Check which ghost states are active
       // Determine appropriate audio track
       // Play/loop if different from current
   }
   ```

4. **Replace Numeric States:**
   ```gml
   // BEFORE
   if fright == 0 { /* normal */ }
   else { /* fright */ }

   // AFTER
   if fright == PAC_FRIGHT.OFF { /* normal */ }
   else { /* fright */ }
   ```

#### Step_2.gml

**Current:** 470 lines, complex corner/turning logic
**Issues:**
- Repeated corner handling (8 corner states × 4 speeds)
- Fragmented speed logic
- Unclear grid alignment math

**Proposed Structure:**

```gml
/// ===============================================================================
/// PAC STEP_2 - MOVEMENT EXECUTION & ANIMATION
/// ===============================================================================
///
/// Main Responsibilities:
/// 1. Complete corner transitions (grid alignment)
/// 2. Apply movement speed based on state
/// 3. Handle vertical wrapping (top/bottom screen edges)
/// 4. Handle horizontal wrapping (tunnel/side edges)
/// 5. Manage animation frame updates
/// 6. Update depth layer based on state
/// 7. Instance deactivation (performance optimization)
///
/// ===============================================================================

// ===== SECTION 1: CORNER TRANSITION COMPLETION =====
/// Complete the corner movement logic started in Step_1
/// Snaps Pac to grid and finalizes direction change

// ===== SECTION 2: SPEED & VELOCITY APPLICATION =====
/// Determine current speed based on state
/// Apply as hspeed/vspeed

// ===== SECTION 3: VERTICAL WRAPPING =====
/// Handle top/bottom edge wrapping
/// Reset position when moving off screen vertically

// ===== SECTION 4: HORIZONTAL WRAPPING =====
/// Handle tunnel/left/right edge wrapping
/// Teleport to opposite side

// ===== SECTION 5: ANIMATION UPDATES =====
/// Update animation frame counter
/// Vary speed based on boost/fright state

// ===== SECTION 6: DEPTH & LAYERING =====
/// Adjust depth based on fright state
/// Higher depth = drawn on top

// ===== SECTION 7: PERFORMANCE OPTIMIZATION =====
/// Deactivate/activate instances based on view
/// Improve performance with large maps
```

---

## Variable Naming Improvements

### Current → Improved Names

| Current | Improved | Reason |
|---------|----------|--------|
| `fright` | `fright_active` | Clarity: is it a flag or timer? |
| `chomp` | `eating_ghost` | Self-documenting |
| `bonked` | `collided_with_player2` | Explicit meaning |
| `corner` | `turn_corner_state` | Explains 1-8 values |
| `siren` | `siren_level` | Shows it's 0-4 range |
| `pluseat` | `bonus_multiplier_active` | Clear purpose |
| `pause` | `movement_paused` | Self-documenting |
| `stoppy` | `dot_collection_pause` | Shows when/why paused |
| `timerstart` | `ghost_release_timer_start` | Specific purpose |
| `forbid` | `ghost_interaction_disabled` | Clearer logic |

### New Constants to Define

```gml
/// Pac States
enum PAC_STATE {
    ALIVE = 0,          // Playing normally
    DYING = 1,          // Death animation
    DEAD = 2,           // Fully dead
    DEAD_FINAL = 3      // Game over state
}

/// Fright/Power Mode States
enum PAC_FRIGHT {
    OFF = 0,            // Normal mode
    ACTIVE = 1          // Power pellet active
}

/// Turn Corner States (1-8, represents turn directions)
enum PAC_CORNER {
    NONE = 0,
    UP_TO_RIGHT_PRE = 1,
    UP_TO_RIGHT_POST = 2,
    RIGHT_TO_UP_PRE = 3,
    RIGHT_TO_UP_POST = 4,
    DOWN_TO_LEFT_PRE = 5,
    DOWN_TO_LEFT_POST = 6,
    LEFT_TO_DOWN_PRE = 7,
    LEFT_TO_DOWN_POST = 8
}

/// Direction Constants
enum PAC_DIRECTION {
    RIGHT = 0,
    UP = 1,
    LEFT = 2,
    DOWN = 3
}

/// Speed Constants
#macro SP_NORMAL 2
#macro SP_FRIGHT 3
#macro SP_INITIAL 0

/// Siren Levels
enum SIREN_LEVEL {
    LEVEL_0 = 0,  // Slow siren
    LEVEL_1 = 1,
    LEVEL_2 = 2,
    LEVEL_3 = 3,
    LEVEL_4 = 4   // Fast siren
}
```

---

## Comment Template for Complex Sections

Use this template for deeply nested or complex logic:

```gml
// ===== [SECTION NAME] =====
/// High-level explanation of what this section does
/// Why it's needed
/// When it executes
///
/// Logic Flow:
/// 1. Check condition A
/// 2. If true, do X
/// 3. If false, do Y
/// 4. Return result
///
/// Important Notes:
/// - Why variable Z is used this way
/// - Edge cases to watch for
/// - Related code that depends on this

if (condition_A) {
    /// Check sub-condition B
    if (condition_B) {
        /// Handle case A+B
        // ... code
    }
    else {
        /// Handle case A only
        // ... code
    }
}
else {
    /// Case A is false, handle alternatives
    // ... code
}
```

---

## Phased Implementation Plan

### Week 1: Foundation
- Define all enums and constants (in global/macros)
- Update Create_0.gml with improved comments
- Replace state values in Create_0.gml only

### Week 2: Movement & Input
- Reformat Step_0.gml with detailed comments
- Reformat Step_1.gml input section (lines 70-300)
- Extract `handle_pac_input()` script

### Week 3: Collision Detection
- Reformat Step_1.gml collision section (lines 320-680)
- Extract `handle_ghost_collision()` script (replaces 4x repeated code)
- Replace all `state = 0/1` with enum values
- Replace all `chomp = 0/1` with enum values

### Week 4: Audio & Game State
- Reformat Step_1.gml audio section (lines 700-900)
- Extract `update_ambience()` script
- Replace all siren logic with SIREN_LEVEL enum

### Week 5: Movement Execution & Polish
- Reformat Step_2.gml (470 lines)
- Extract corner completion logic if needed
- Add performance notes
- Final enum replacement pass

---

## Benefits of This Refactoring

| Area | Improvement |
|------|-------------|
| **Readability** | 30-40% reduction in cognitive load |
| **Maintainability** | Easier to find and modify specific logic |
| **Consistency** | Matches oGhost formatting standards |
| **Testing** | Extracted scripts easier to unit test |
| **Reusability** | Scripts can be used in other objects |
| **Performance** | Better instance management |
| **Documentation** | Self-documenting code with enums |

---

## Implementation Checklist

- [ ] Create enums in global macros file
- [ ] Update Create_0.gml variable documentation
- [ ] Add detailed header comments to each event
- [ ] Refactor Step_0.gml direction logic
- [ ] Extract handle_pac_input() script
- [ ] Extract handle_ghost_collision() script
- [ ] Extract update_ambience() script
- [ ] Replace numeric values with enums throughout
- [ ] Add section breaks and sub-comments
- [ ] Test movement functionality
- [ ] Test ghost collision
- [ ] Test audio transitions
- [ ] Final review and polish

---

## Example: Before & After Comparison

### Ghost Collision Code - BEFORE (Repeated 4x)

```gml
if chomp = 0{if dead = 0{
if ((16*(round(x/16)) = Blinky.tilex and 16*(round(y/16)) = Blinky.tiley) or (abs(x - Blinky.x) < 5 and abs(y - Blinky.y) < 5)) and Blinky.house = 0{
    with Blinky{
        if Pac.prohibit = 1{}else{if state = 1 and Pac.chomp = 0{
            Pac.bonked = 0; Pac.chomper = 1;
            // ... 20 more lines of duplicated logic
        }}
        if state = 0 and Pac.dead = 0{
            Pac.deader = 1; Pac.dead = 1; Pac.alarm[11] = 60;
            // ... 10 more lines
        }
    }
}}}
```

### Ghost Collision Code - AFTER

```gml
// ===== GHOST COLLISION DETECTION =====
/// Check collision with each ghost
/// Ghosts can eat Pac (normal mode) or Pac eats ghosts (fright mode)

if (eating_ghost == PAC_FRIGHT.OFF && pac_state == PAC_STATE.ALIVE) {
    // Pac is not currently eating a ghost
    // Check each ghost and handle collision
    handle_blinky_collision();
    handle_pinky_collision();
    handle_inky_collision();
    handle_clyde_collision();
}
```

With extracted script:

```gml
/// scripts/handle_blinky_collision/handle_blinky_collision.gml
function handle_blinky_collision() {
    /// Check if Pac and Blinky are at same grid position
    var _at_same_position = (
        (tilex == Blinky.tilex && tiley == Blinky.tiley) ||
        (abs(x - Blinky.x) < 5 && abs(y - Blinky.y) < 5)
    );

    if (!_at_same_position || Blinky.house == 1) {
        return;  // No collision
    }

    with (Blinky) {
        if (Pac.ghost_interaction_disabled) {
            return;  // Interaction blocked
        }

        if (state == GHOST_STATE.FRIGHTENED && Pac.eating_ghost == PAC_FRIGHT.OFF) {
            /// Pac eats Blinky!
            handle_pac_eating_ghost(Blinky);
        }
        else if (state == GHOST_STATE.CHASE && Pac.pac_state == PAC_STATE.ALIVE) {
            /// Blinky eats Pac!
            handle_pac_eaten_by_ghost(Blinky);
        }
    }
}
```

---

## Notes

- This guide provides structure; adapt as needed for specific game mechanics
- Test thoroughly after each phase
- Consider performance implications of changes
- Maintain backward compatibility with existing systems
- Document any deviations from this plan
