# Game Manager Refactoring Summary

## Overview
This document tracks the refactoring of the Pac object to separate game management logic into a new `oGameManager` object.

## Completed Changes

### 1. Created oGameManager Object
- **Location:** `objects/oGameManager/`
- **Files Created:**
  - `oGameManager.yy` - Object definition (persistent, invisible)
  - `Create_0.gml` - Game state variable initialization
  - `Other_4.gml` - Level-specific configuration (Room Start event)

### 2. Variables Moved to oGameManager

#### Level State Management
- `start` - Level start freeze state
- `finish` - Level completion flag
- `dotcount` - Total dots collected this level
- `countdown` - Death/respawn countdown timer
- `blink` - Animation blink for level transitions

#### Ghost AI Cycle Management
- `scatter` - Scatter mode active flag (chase vs scatter)
- `cycle` - Game cycle counter for scatter/chase phases
- `scatter1-4` - Scatter timing configuration per phase
- `chase1-3` - Chase timing configuration per phase

#### Ghost Release Timing
- `timer` - Ghost release countdown timer
- `timerstart` - Timer start value (level-dependent)
- `psig` - Pinky release signature (dot threshold)
- `isig` - Inky release signature (dot threshold)
- `csig` - Clyde release signature (dot threshold)

#### Fright Mode (Power Pellet)
- `fright` - Current fright mode state (OFF/ACTIVE)
- `frighttime` - Fright mode duration in frames (per level)
- `bonustime` - Bonus time for extended fright
- `chompcount` - Consecutive ghosts eaten counter
- `pluseat` - Bonus multiplier active flag
- `prohibit` - Ghost interaction control (which player can eat ghosts)

#### Audio/Ambience
- `siren` - Siren progression level (0-4)
- `ambience` - Current background audio state

#### Plus Mode
- `plus` - Plus mode bonus multiplier state
- `plus2` - Player 2 plus mode state

#### Speed Configuration
- `sp` - Normal movement speed (level-dependent)
- `spfright` - Power pellet mode speed (level-dependent)

#### Dot Collection
- `dot` - Dot sound index (alternates between sounds)

### 3. Updated Pac Object Files

#### Pac/Create_0.gml
- ✅ Removed all game management variable initialization
- ✅ Added oGameManager object creation
- ✅ Added comments noting which variables moved to oGameManager
- ✅ Kept only Pacman character-specific variables (movement, animation, position, etc.)

#### Pac/Other_4.gml (Room Start)
- ✅ Completely rewritten to only handle player-specific initialization
- ✅ Removed level configuration, speed settings, fright timings, scatter/chase timing
- ✅ References oGameManager.sp for initial movement speed
- ✅ References oGameManager.start for visibility control

#### Pac/Alarm_0.gml (Fright Mode Timer)
- ✅ Updated to use `oGameManager.fright`
- ✅ Updated to use `oGameManager.prohibit`
- ✅ Updated to use `oGameManager.plus2`
- ✅ Updated to use `oGameManager.sp` for speed reset
- ✅ Updated to use `oGameManager.chompcount`
- ✅ Updated to use `oGameManager.pluseat`

## Variables Remaining in Pac Object (Character-Specific)

### Movement
- `xdir, ydir, dir` - Direction vectors and cardinal direction
- `xdir2, ydir2, dir2` - Player 2 direction vectors
- `hspeed, vspeed` - Actual velocity components
- `hspeed2, vspeed2` - Player 2 velocity
- `corner, corner2` - Corner transition states
- `cornercheck, corner2check` - Corner validation counters
- `park, park2` - Buffered direction input

### Position
- `x, y, x2, y2` - Player positions
- `tilex, tiley, tilex2, tiley2` - Grid-aligned positions
- `newtile, newtile2` - New tile detection flags

### Animation
- `im, im2` - Image/animation frame indices
- `i2m, i2m2, deadani2m` - Backup animation indices
- `deadanim` - Death animation frame counter
- `scale` - Sprite scaling factor
- `eatdir, eatdir2` - Eating animation direction

### Player State
- `dead, deader` - Death state flags
- `pause, pause2` - Movement pause counters
- `stoppy, stoppy2` - Suspension states during dot collection
- `bonked, bonked2` - Player collision flags
- `chomp, chomper` - Ghost eating animation flags

### Direction Helpers
- `direction, direction2` - Facing direction in degrees

## Files That Need Updates

### Critical Priority (Direct References to Moved Variables)

The following Pac object files need to be updated to reference `oGameManager` instead of `Pac`:

1. **Pac/Alarm_1.gml** - Likely references fright/cycle timing
2. **Pac/Alarm_4.gml** - Unknown, needs review
3. **Pac/Alarm_8.gml** - Likely references blink animation
4. **Pac/Alarm_9.gml** - Unknown, needs review
5. **Pac/Alarm_10.gml** - Likely references start/timer
6. **Pac/Alarm_11.gml** - Death/life loss - references many game state variables
7. **Pac/Step_0.gml** - Direction sync - may reference start/finish
8. **Pac/Step_1.gml** - Main game logic - **MANY REFERENCES**
9. **Pac/Step_2.gml** - Corner/movement - references fright, plus2, scatter, siren, ambience
10. **Pac/Draw_0.gml** - May reference finish/start for visibility
11. **Pac/KeyPress_*.gml** - Unknown, needs review

### Search Patterns for Finding References

Use these grep patterns to find all references that need updating:

```bash
# Find references to moved variables in Pac object
grep -r "Pac\\.fright" objects/Pac/
grep -r "Pac\\.frighttime" objects/Pac/
grep -r "Pac\\.scatter" objects/Pac/
grep -r "Pac\\.cycle" objects/Pac/
grep -r "Pac\\.chompcount" objects/Pac/
grep -r "Pac\\.pluseat" objects/Pac/
grep -r "Pac\\.plus" objects/Pac/
grep -r "Pac\\.plus2" objects/Pac/
grep -r "Pac\\.prohibit" objects/Pac/
grep -r "Pac\\.siren" objects/Pac/
grep -r "Pac\\.ambience" objects/Pac/
grep -r "Pac\\.dotcount" objects/Pac/
grep -r "Pac\\.start" objects/Pac/
grep -r "Pac\\.finish" objects/Pac/
grep -r "Pac\\.countdown" objects/Pac/
grep -r "Pac\\.sp[^a-z]" objects/Pac/
grep -r "Pac\\.spfright" objects/Pac/
grep -r "Pac\\.psig" objects/Pac/
grep -r "Pac\\.isig" objects/Pac/
grep -r "Pac\\.csig" objects/Pac/
grep -r "Pac\\.timer" objects/Pac/
grep -r "Pac\\.timerstart" objects/Pac/
grep -r "Pac\\.dot[^c]" objects/Pac/
grep -r "Pac\\.blink" objects/Pac/

# Find references in other objects and scripts
grep -r "Pac\\.fright" objects/ scripts/ --exclude-dir=Pac
grep -r "Pac\\.scatter" objects/ scripts/ --exclude-dir=Pac
# ... etc for all moved variables
```

### Variable Reference Mapping

When updating code, use these replacements:

| Old Reference | New Reference |
|--------------|--------------|
| `Pac.fright` | `oGameManager.fright` |
| `Pac.frighttime` | `oGameManager.frighttime` |
| `Pac.bonustime` | `oGameManager.bonustime` |
| `Pac.scatter` | `oGameManager.scatter` |
| `Pac.cycle` | `oGameManager.cycle` |
| `Pac.scatter1-4` | `oGameManager.scatter1-4` |
| `Pac.chase1-3` | `oGameManager.chase1-3` |
| `Pac.chompcount` | `oGameManager.chompcount` |
| `Pac.pluseat` | `oGameManager.pluseat` |
| `Pac.plus` | `oGameManager.plus` |
| `Pac.plus2` | `oGameManager.plus2` |
| `Pac.prohibit` | `oGameManager.prohibit` |
| `Pac.siren` | `oGameManager.siren` |
| `Pac.ambience` | `oGameManager.ambience` |
| `Pac.dotcount` | `oGameManager.dotcount` |
| `Pac.start` | `oGameManager.start` |
| `Pac.finish` | `oGameManager.finish` |
| `Pac.countdown` | `oGameManager.countdown` |
| `Pac.sp` | `oGameManager.sp` |
| `Pac.spfright` | `oGameManager.spfright` |
| `Pac.psig` | `oGameManager.psig` |
| `Pac.isig` | `oGameManager.isig` |
| `Pac.csig` | `oGameManager.csig` |
| `Pac.timer` | `oGameManager.timer` |
| `Pac.timerstart` | `oGameManager.timerstart` |
| `Pac.dot` (sound index) | `oGameManager.dot` |
| `Pac.blink` | `oGameManager.blink` |

**Note:** Be careful with `Pac.dot` - it should only be replaced when referring to the sound index, NOT when referring to `dotcount` or dot collision detection.

## Other Objects That May Need Updates

Search these objects/scripts for references to Pac's moved variables:

### Ghost Objects
- `objects/Blinky/` - May reference Pac.scatter, Pac.fright, Pac.prohibit
- `objects/Pinky/` - Same as Blinky
- `objects/Inky/` - Same as Blinky
- `objects/Clyde/` - Same as Blinky
- `objects/oGhost/` - Base ghost object

### Other Game Objects
- `objects/Fruit/` - May reference Pac.plus, Pac.bonustime, Pac.fright
- `objects/Power/` - Power pellet, may reference Pac.fright
- `objects/Drawless/` - HUD drawing, may reference Pac.start, Pac.finish, Pac.dotcount
- `objects/Pauser/` - Pause handler
- `objects/Mac/` - Player 2 character

### Scripts
- `scripts/beginstep/` - May reference game state
- `scripts/beginstep2/` - Player 2 logic
- `scripts/endstep/` - May reference game state
- `scripts/movement2/` - Player 2 movement
- `scripts/sickofit/` - Unknown
- `scripts/handle_pac_input/` - Input handling

## Testing Checklist

After completing all updates:

1. ✅ Test level start - verify oGameManager is created
2. ⬜ Test dot collection - verify dotcount increments correctly
3. ⬜ Test power pellet collection - verify fright mode activates
4. ⬜ Test ghost eating - verify chompcount and scoring work
5. ⬜ Test level completion - verify finish flag and transition
6. ⬜ Test death/respawn - verify life loss and state reset
7. ⬜ Test scatter/chase cycles - verify ghost behavior transitions
8. ⬜ Test audio - verify siren progression and ambience changes
9. ⬜ Test two-player mode - verify plus2 and prohibit work correctly
10. ⬜ Test plus mode - verify bonus multipliers work

## Benefits of This Refactoring

1. **Separation of Concerns:** Game state is now separate from player character
2. **Easier Debugging:** Game state variables are in one place
3. **Better Architecture:** Clear distinction between game management and player logic
4. **Easier to Extend:** Adding new game modes or features is now simpler
5. **Reduced Coupling:** Other objects can reference game state without depending on Pac object

## Next Steps

1. Update all remaining Pac object event files to use oGameManager references
2. Search all other objects and scripts for references to moved variables
3. Update those references to use oGameManager
4. Test thoroughly to ensure all functionality still works
5. Consider additional refactoring opportunities (e.g., score management, level progression)
