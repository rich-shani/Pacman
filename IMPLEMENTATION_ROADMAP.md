# Blinky Inheritance Implementation Roadmap
## Complete Step-by-Step Action Plan

---

## 📋 Document Navigation

You now have 8 complete documents:

| Document | Purpose | Read When |
|----------|---------|-----------|
| **BLINKY_INHERITANCE_STEPS.md** | 10-phase detailed plan | Starting implementation |
| **INHERITANCE_QUICK_SUMMARY.md** | Quick visual reference | Need quick answers |
| **BLINKY_NEW_CREATE_0GML.md** | Exact code to use | Ready to code |
| **IMPLEMENTATION_ROADMAP.md** | This file - step checklist | Following the plan |
| BLINKY_CONVERSION_GUIDE.md | Enum system reference | Understanding conversions |
| BLINKY_REFACTORING_SUMMARY.md | Overview & benefits | Context/planning |
| QUICK_ENUM_REFERENCE.md | Copy/paste enum patterns | Code patterns |
| BLINKY_DOCS_INDEX.md | Documentation index | Finding resources |

---

## ⚡ Express Lane (1 Hour Implementation)

### Step 0: Preparation (5 minutes)
```
☐ Open BLINKY_NEW_CREATE_0GML.md
☐ Open GameMaker project
☐ Open Blinky object properties
☐ Have git ready (git status, git add, etc.)
```

### Step 1: Set Parent (3 minutes)
```
☐ Right-click Blinky object
☐ Select Properties
☐ Find Parent Object dropdown
☐ Select "oGhost"
☐ Click Apply
☐ Save project (Ctrl+S)
```

### Step 2: Update Create_0.gml (10 minutes)
```
☐ Open objects/Blinky/Create_0.gml
☐ Select all (Ctrl+A)
☐ Delete
☐ Paste code from BLINKY_NEW_CREATE_0GML.md
☐ Save (Ctrl+S)
☐ Verify: No red syntax errors
☐ Compile: Ctrl+F7 (should succeed)
```

### Step 3: Delete 3 Files (5 minutes)
```
☐ Delete objects/Blinky/Step_2.gml
☐ Delete objects/Blinky/Other_0.gml
☐ Delete objects/Blinky/Other_4.gml
☐ Compile: Ctrl+F7 (should succeed)
```

### Step 4: Quick Test (15 minutes)
```
☐ Run game (Ctrl+F5)
☐ Test: Blinky spawns at correct position
☐ Test: Blinky chases Pac
☐ Test: Blinky turns at intersections
☐ Test: Blinky moves smoothly
☐ Test: Speed feels right
☐ Test: Wrapping works
☐ Test: Scatter mode works (wait or trigger)
☐ Test: Frightened mode works (eat power pellet)
☐ Test: House logic works (let Pac eat you)
```

### Step 5: Commit (5 minutes)
```
☐ git add objects/Blinky/
☐ git commit -m "refactor: Blinky inherits from oGhost, remove duplicate code"
☐ git log (verify commit)
```

**Total Time: ~45 minutes (with testing)**

---

## 🔍 Detailed Implementation Phases

### PHASE 1: SETUP (10 minutes)

**Task:** Set oGhost as parent object in GameMaker

**File to Modify:** Blinky.yy

**Steps:**
```
1. In GameMaker IDE, right-click Blinky object
2. Select Properties
3. Find "Parent Object" dropdown (currently "<none>")
4. Click dropdown
5. Select "oGhost"
6. Click Apply button
7. Close properties window
8. Save project (File → Save or Ctrl+S)
```

**Verification:**
- [ ] Blinky properties show Parent: oGhost
- [ ] Project saves without errors
- [ ] Blinky.yy contains: "parentObjectId":{"name":"oGhost","path":"objects/oGhost/oGhost.yy"}

**Troubleshooting:**
- If oGhost not in dropdown: Verify objects/oGhost/ exists
- If project won't save: Close any open dialogs, try again

**Next:** Phase 2

---

### PHASE 2: CREATE_0.GML (15 minutes)

**Task:** Update Create_0.gml with inheritance pattern

**File to Modify:** objects/Blinky/Create_0.gml

**Steps:**
```
1. In GameMaker, double-click Blinky Create_0 event
2. Select all content (Ctrl+A)
3. Delete all content
4. Copy entire code from BLINKY_NEW_CREATE_0GML.md
5. Paste into editor (Ctrl+V)
6. Save file (Ctrl+S)
7. Verify: No red syntax error lines
8. Compile test: Press Ctrl+F7
```

**Expected Result:**
```
✅ File compiles without errors
✅ No "undefined variable" warnings
✅ event_inherited() is recognized
✅ Enums recognized (GHOST_STATE, GHOST_DIRECTION)
✅ Function recognized (ghost_color_blinky)
```

**Verification:**
- [ ] File saved
- [ ] No red syntax errors in editor
- [ ] Compilation succeeds
- [ ] No error messages in output

**Troubleshooting:**
- Undefined ghost_color_blinky: Check scripts/ghost_colors/ exists
- Undefined GHOST_STATE/GHOST_DIRECTION: Check scripts/ for enum files
- event_inherited not recognized: Verify oGhost is parent (Phase 1)

**Next:** Phase 3

---

### PHASE 3: ANALYZE EVENTS (10 minutes)

**Task:** Review Blinky events to identify what to delete

**Files to Review:**
- objects/Blinky/Step_0.gml (should not exist)
- objects/Blinky/Step_1.gml (keep - Blinky unique)
- objects/Blinky/Step_2.gml (delete - duplicate)
- objects/Blinky/Draw_0.gml (keep - Blinky unique)
- objects/Blinky/Alarm_0.gml (decide - maybe keep)
- objects/Blinky/Other_0.gml (delete - duplicate)
- objects/Blinky/Other_4.gml (delete - duplicate)

**Steps:**
```
1. List all files in objects/Blinky/ folder
2. Open Step_0.gml: Should not exist (skip)
3. Open Step_1.gml: Read briefly
   → This is Blinky's unique chase logic (KEEP)
4. Open Step_2.gml: Read briefly
   → This is house/speed/turning logic (DELETE)
5. Open Draw_0.gml: Read briefly
   → This is Blinky's unique rendering (KEEP)
6. Open Alarm_0.gml: Read briefly
   → This has Pac interaction (KEEP for now)
7. Open Other_0.gml: Read briefly
   → This is tunnel wrapping (DELETE)
8. Open Other_4.gml: Read briefly
   → This is speed initialization (DELETE)
```

**Checklist:**
- [ ] Step_1.gml reviewed (102 lines, unique chase)
- [ ] Step_2.gml reviewed (289 lines, duplicate)
- [ ] Draw_0.gml reviewed (221 lines, unique rendering)
- [ ] Alarm_0.gml reviewed (150 lines, mixed)
- [ ] Other_0.gml reviewed (19 lines, duplicate)
- [ ] Other_4.gml reviewed (148 lines, duplicate)

**Next:** Phase 4

---

### PHASE 4: DELETE STEP_2.GML (5 minutes)

**Task:** Delete Blinky's Step_2.gml (inherited from oGhost)

**File to Delete:** objects/Blinky/Step_2.gml

**Steps (GameMaker IDE):**
```
1. Expand Blinky object in Objects folder
2. Right-click "Step_2" event
3. Select "Delete Event"
4. Confirm deletion
5. Save project
```

**Steps (Command Line):**
```bash
rm objects/Blinky/Step_2.gml
```

**Verification:**
- [ ] Step_2.gml file deleted from folder
- [ ] Blinky object no longer shows Step_2 (or shows grayed out)
- [ ] Project still compiles

**Testing:**
```
1. Press Ctrl+F7 to compile
2. Check: No errors or warnings
3. Expected: Compilation succeeds
```

**What Happens Next:**
- When game runs, Blinky's Step_2 will automatically use oGhost's Step_2
- House logic, speed control, turning all inherited

**Troubleshooting:**
- If Step_2 still shows: Hard refresh or restart GameMaker
- If won't compile: Check other files are intact

**Next:** Phase 5

---

### PHASE 5: DELETE OTHER_0.GML (3 minutes)

**Task:** Delete Blinky's Other_0.gml (inherited from oGhost)

**File to Delete:** objects/Blinky/Other_0.gml

**Steps:**
```
1. Right-click Blinky "Other_0" event
2. Select "Delete Event"
3. Confirm
4. Save project
```

**Verification:**
- [ ] Other_0.gml file deleted
- [ ] Compilation succeeds
- [ ] Blinky object shows no Other_0 event

**What Happens:**
- Tunnel wraparound inherited from oGhost
- Blinky wraps at left/right edges automatically

**Next:** Phase 6

---

### PHASE 6: DELETE OTHER_4.GML (3 minutes)

**Task:** Delete Blinky's Other_4.gml (inherited from oGhost)

**File to Delete:** objects/Blinky/Other_4.gml

**Steps:**
```
1. Right-click Blinky "Other_4" event
2. Select "Delete Event"
3. Confirm
4. Save project
```

**Verification:**
- [ ] Other_4.gml file deleted
- [ ] Compilation succeeds
- [ ] Blinky object shows no Other_4 event

**What Happens:**
- Speed initialization inherited from oGhost
- Speeds correct for all levels automatically

**Next:** Phase 7

---

### PHASE 7: COMPREHENSIVE TEST (20 minutes)

**Task:** Test all Blinky behavior after deletions

**Setup:**
```
1. Save all files (Ctrl+S)
2. Compile (Ctrl+F7)
3. Run game (Ctrl+F5)
```

**Test Checklist:**

**Spawning:**
- [ ] Blinky appears at (216, 224)
- [ ] Blinky is red color
- [ ] No undefined variable errors
- [ ] No performance issues

**Movement:**
- [ ] Blinky moves smoothly
- [ ] Movement is responsive
- [ ] Speed feels correct for level
- [ ] No stuttering or lag

**Turning:**
- [ ] Blinky turns at intersections
- [ ] Turns are smooth and grid-aligned
- [ ] No stuck positions
- [ ] Pathfinding works

**Chase Behavior:**
- [ ] Blinky chases Pac directly
- [ ] Pursuit is aggressive
- [ ] Direction changes smooth
- [ ] Catches Pac within reasonable time

**Scatter Mode (if available):**
- [ ] Blinky enters scatter mode
- [ ] Moves to top-left (32, 32)
- [ ] Scatter behavior correct
- [ ] Switches back to chase correctly

**Wrapping:**
- [ ] Left tunnel: exits right side
- [ ] Right tunnel: exits left side
- [ ] Smooth continuous movement
- [ ] Tile coordinates correct after wrap

**Speed:**
- [ ] Normal speed correct (1.875)
- [ ] Can test other levels if available
- [ ] Elroy mode activates (if testable)
- [ ] Boost mode works (if available)

**Frightened Mode (if can trigger):**
- [ ] Blinky turns blue
- [ ] Moves randomly (not chasing)
- [ ] Speed reduced (1.25)
- [ ] Flashing effect near end
- [ ] Can be eaten

**Eaten & House:**
- [ ] Blinky can be eaten by Pac (during power pellet)
- [ ] Transitions to eyes
- [ ] Eyes return to house
- [ ] Enters house correctly
- [ ] Bounces inside house
- [ ] Exits and resumes play
- [ ] Returns to normal color

**Graphics:**
- [ ] Sprite animation smooth
- [ ] No visual glitches
- [ ] Colors correct
- [ ] Eyes render correctly
- [ ] Wrapping invisible

**Comparison with Original:**
- [ ] Compare with backup of original code
- [ ] Gameplay should be identical
- [ ] No noticeable differences
- [ ] Record any differences found

**Result:**
- [ ] All tests pass
- [ ] Behavior matches original
- [ ] No errors or warnings
- [ ] Ready to commit

**Troubleshooting Test Failures:**

**Problem: Blinky doesn't move**
- Check: Step_2 event inherited? (Should show grayed out in UI)
- Check: oGhost has Step_2.gml?
- Check: Create_0 has event_inherited()?
- Solution: Restore Step_2.gml, investigate difference

**Problem: Movement different from original**
- Check: Speed values correct?
- Check: Turning logic same?
- Check: House logic working?
- Solution: Compare Step_2 files line-by-line

**Problem: Wrapping broken**
- Check: Other_0 inherited?
- Check: oGhost has Other_0.gml?
- Solution: Restore Other_0.gml temporarily

**Problem: Speeds wrong**
- Check: Other_4 inherited?
- Check: oGhost has Other_4.gml?
- Solution: Restore Other_4.gml temporarily

**Next:** Phase 8

---

### PHASE 8: REGRESSION TEST (15 minutes)

**Task:** Compare with original implementation

**Preparation:**
```
1. Note current behavior (from Phase 7 tests)
2. Load original backup if available
3. Run same tests with original
4. Compare results
```

**Testing Matrix:**

| Behavior | Original | New | Match? |
|----------|----------|-----|--------|
| Spawn position | (216, 224) | ? | ☐ |
| Color | Red | ? | ☐ |
| Chase speed | 1.875 | ? | ☐ |
| Turning | Smooth | ? | ☐ |
| House logic | Works | ? | ☐ |
| Wrapping | Smooth | ? | ☐ |
| Scatter | Moves to (32,32) | ? | ☐ |
| Frightened | Blue + random | ? | ☐ |
| Eaten | Eyes return | ? | ☐ |
| Animation | Smooth 16-frame | ? | ☐ |

**Verification:**
- [ ] All behaviors match original
- [ ] No differences detected
- [ ] Gameplay indistinguishable
- [ ] Performance same or better

**Expected Result:**
- All checks should match
- If any differences: Debug and fix

**Next:** Phase 9

---

### PHASE 9: CODE VERIFICATION (10 minutes)

**Task:** Verify code structure is correct

**Checks:**

**Create_0.gml Structure:**
```
☐ event_inherited() is first line
☐ Only Blinky-specific variables remain
☐ No duplicate oGhost variables
☐ Comments clear and organized
☐ ~30 lines total
```

**Deleted Files Verified:**
```
☐ Step_2.gml deleted
☐ Other_0.gml deleted
☐ Other_4.gml deleted
☐ Step_0.gml never existed (OK)
```

**Remaining Files Intact:**
```
☐ Step_1.gml (102 lines, unchanged)
☐ Draw_0.gml (221 lines, unchanged)
☐ Alarm_0.gml (150 lines, maybe unchanged)
```

**Parent Relationship:**
```
☐ oGhost is parent (check Blinky.yy)
☐ Inheritance chain works
☐ Variables inherited correctly
☐ Events inherited as expected
```

**Compiler Status:**
```
☐ No errors
☐ No warnings
☐ Clean compilation
```

**Next:** Phase 10

---

### PHASE 10: COMMIT & CLEANUP (10 minutes)

**Task:** Commit changes to git

**Preparation:**
```
1. Remove any debug code
2. Verify all tests pass
3. Check code formatting
4. Review all changes
```

**Git Commands:**
```bash
# Check status
git status
# Output should show modified and deleted files

# Add changes
git add objects/Blinky/

# Verify what will be committed
git diff --cached objects/Blinky/

# Commit with descriptive message
git commit -m "refactor: Blinky inherits from oGhost, remove 456 lines of duplicate code

- Set oGhost as parent object
- Updated Create_0.gml: Add event_inherited(), remove 18 lines of duplicates
- Deleted Step_2.gml: Use oGhost's house/speed/turning logic (289 lines)
- Deleted Other_0.gml: Use oGhost's tunnel wrapping (19 lines)
- Deleted Other_4.gml: Use oGhost's speed initialization (148 lines)
- Kept Step_1.gml: Blinky's unique chase behavior (102 lines)
- Kept Draw_0.gml: Blinky's unique rendering (221 lines)

Total reduction: ~700 lines → ~350 lines (-50% code duplication)
Gameplay: Identical to original implementation
Testing: All behaviors verified and working correctly"

# View commit
git log -1 --oneline

# Optional: View detailed changes
git show HEAD
```

**Verification:**
- [ ] git add objects/Blinky/ succeeds
- [ ] git diff --cached shows correct changes
- [ ] git commit succeeds
- [ ] git log shows new commit
- [ ] No uncommitted changes remaining

**Cleanup:**
```
☐ Close any debug windows
☐ Delete any temporary test files
☐ Remove backup copies if no longer needed
☐ Document changes in README if applicable
☐ Notify team of changes (if applicable)
```

**Final Status:**
- [ ] All changes committed
- [ ] Code clean and formatted
- [ ] Tests passing
- [ ] Documentation updated
- [ ] Ready for next phase

---

## ✅ Success Checklist

### Before Implementation
- [ ] Read BLINKY_INHERITANCE_STEPS.md
- [ ] Read INHERITANCE_QUICK_SUMMARY.md
- [ ] Have git ready
- [ ] Know how to test in GameMaker
- [ ] Have backup of current code

### Phase Completion
- [ ] Phase 1: Parent set (5 min) ✅
- [ ] Phase 2: Create_0 updated (15 min) ✅
- [ ] Phase 3: Events analyzed (10 min) ✅
- [ ] Phase 4: Step_2 deleted (5 min) ✅
- [ ] Phase 5: Other_0 deleted (3 min) ✅
- [ ] Phase 6: Other_4 deleted (3 min) ✅
- [ ] Phase 7: Comprehensive test (20 min) ✅
- [ ] Phase 8: Regression test (15 min) ✅
- [ ] Phase 9: Code verification (10 min) ✅
- [ ] Phase 10: Commit & cleanup (10 min) ✅

### Functional Requirements Met
- [ ] Blinky compiles without errors
- [ ] Blinky spawns at correct position
- [ ] Blinky moves smoothly in all directions
- [ ] Blinky turns at intersections correctly
- [ ] Speed values correct for all levels
- [ ] Scatter mode works
- [ ] Frightened mode works
- [ ] House logic works (eaten & return)
- [ ] Tunnel wrapping works
- [ ] Animation smooth and correct
- [ ] Colors correct
- [ ] Behavior identical to original

### Code Quality Met
- [ ] oGhost is parent in Blinky.yy
- [ ] Create_0.gml has event_inherited() as first line
- [ ] Create_0.gml only has Blinky-specific code (~30 lines)
- [ ] Step_2.gml deleted (inherited from oGhost)
- [ ] Other_0.gml deleted (inherited from oGhost)
- [ ] Other_4.gml deleted (inherited from oGhost)
- [ ] Step_1.gml unchanged (Blinky unique)
- [ ] Draw_0.gml unchanged (Blinky unique)
- [ ] No code duplication
- [ ] Clean, readable comments

### Documentation Met
- [ ] Changes documented in git commit
- [ ] Commit message clear and detailed
- [ ] No uncommitted changes
- [ ] Code ready for review

---

## 📊 Results Summary

### Code Reduction
- **Before:** ~700 lines total
- **After:** ~350 lines total
- **Reduction:** 350 lines (-50%) 🎉

### Files Changed
- **Modified:** Create_0.gml (48 → 30 lines)
- **Deleted:** Step_2.gml (289 lines)
- **Deleted:** Other_0.gml (19 lines)
- **Deleted:** Other_4.gml (148 lines)
- **Unchanged:** Step_1.gml (102 lines - unique)
- **Unchanged:** Draw_0.gml (221 lines - unique)

### Inheritance Pattern
- **Parent:** oGhost (1200+ lines of shared code)
- **Child:** Blinky (350 lines of unique code)
- **Total:** 1550 lines (vs 1900 before)

### Duplication Removed
- Animation: 0% (inherited)
- Movement: 0% (inherited)
- Speed: 0% (inherited)
- House logic: 0% (inherited)
- Wrapping: 0% (inherited)
- Chase logic: 100% (unique to Blinky)
- Rendering: 100% (unique to Blinky)

---

## 🎯 Next: Apply to Other Ghosts

After Blinky is complete, apply same pattern:

### Pinky
- Similar to Blinky
- Unique: Step_1 (4-tile-ahead chase)
- Keep: Draw_0 (pink color)
- Delete: Step_2, Other_0, Other_4

### Inky
- Complex behavior
- Unique: Step_1 (Blinky offset vector)
- Keep: Draw_0 (cyan color)
- Delete: Step_2, Other_0, Other_4

### Clyde
- Distance-based
- Unique: Step_1 (distance check)
- Keep: Draw_0 (orange color)
- Delete: Step_2, Other_0, Other_4

**Time to complete all 4 ghosts: ~2-3 hours**

---

## 📚 Quick Reference

### Key Files
- **Implementation:** BLINKY_INHERITANCE_STEPS.md
- **Code:** BLINKY_NEW_CREATE_0GML.md
- **Quick:** INHERITANCE_QUICK_SUMMARY.md
- **This:** IMPLEMENTATION_ROADMAP.md

### Key Commands
```bash
git status                           # Check changes
git add objects/Blinky/              # Stage changes
git commit -m "message"              # Commit with message
git log -1                           # View latest commit
```

### Key Variables
- **Inherited from oGhost:** im, tilex, tiley, state, direction, dir, sp, speeds, etc.
- **Set by Blinky:** ghost_name, ghost_color, xstart, ystart, cornerx, cornery

### Key Functions
- **event_inherited()** - Load parent's Create_0 variables (MUST be first line!)
- **ghost_color_blinky()** - Returns red RGB color

---

## ⏱️ Time Estimates

| Phase | Task | Time | Total |
|-------|------|------|-------|
| 1 | Set parent | 5 min | 5 min |
| 2 | Create_0 | 15 min | 20 min |
| 3 | Analysis | 10 min | 30 min |
| 4 | Delete Step_2 | 5 min | 35 min |
| 5 | Delete Other_0 | 3 min | 38 min |
| 6 | Delete Other_4 | 3 min | 41 min |
| 7 | Test | 20 min | 61 min |
| 8 | Regression | 15 min | 76 min |
| 9 | Verification | 10 min | 86 min |
| 10 | Commit | 10 min | 96 min |

**Total: ~1.5 hours (including testing)**

---

## 🚀 You're Ready!

Follow the 10 phases above and your Blinky inheritance will be complete!

**Questions? Check the detailed BLINKY_INHERITANCE_STEPS.md**

**Need exact code? Check BLINKY_NEW_CREATE_0GML.md**

**Need quick answers? Check INHERITANCE_QUICK_SUMMARY.md**

---

**Happy Refactoring! 🎮**
