# Quick Enum Reference for Blinky
## Copy & Paste Guide for Common Conversions

---

## State Conversions

### Old → New

```gml
// BEFORE: Magic numbers
state = 0;
state = 1;
state = 2;
state = 3;
state = 4;

// AFTER: Enums
state = GHOST_STATE.CHASE;
state = GHOST_STATE.FRIGHTENED;
state = GHOST_STATE.EYES;
state = GHOST_STATE.IN_HOUSE;
state = GHOST_STATE.HOUSE_READY;
```

### Conditional Checks

```gml
// BEFORE
if (state == 0) { }
if (state == 1) { }
if (state == 2) { }
if (state < 2) { }

// AFTER
if (state == GHOST_STATE.CHASE) { }
if (state == GHOST_STATE.FRIGHTENED) { }
if (state == GHOST_STATE.EYES) { }
if (state < GHOST_STATE.EYES) { }
```

---

## Direction Conversions

### Old → New (Cardinal Format)

```gml
// BEFORE
dir = 0;
dir = 1;
dir = 2;
dir = 3;

// AFTER
dir = GHOST_DIRECTION.RIGHT;
dir = GHOST_DIRECTION.UP;
dir = GHOST_DIRECTION.LEFT;
dir = GHOST_DIRECTION.DOWN;
```

### Direction Degree Format

```gml
// BEFORE: Manual calculation
direction = dir * 90;  // dir 0-3 → direction 0/90/180/270

// AFTER: Use function
direction = direction_from_cardinal(dir);

// EXAMPLE
direction = direction_from_cardinal(GHOST_DIRECTION.UP);  // Returns 90°
```

### Turning Logic

```gml
// BEFORE
if (dir == 0) { }       // RIGHT
if (dir == 1) { }       // UP
if (dir == 2) { }       // LEFT
if (dir == 3) { }       // DOWN

// AFTER
if (dir == GHOST_DIRECTION.RIGHT) { }
if (dir == GHOST_DIRECTION.UP) { }
if (dir == GHOST_DIRECTION.LEFT) { }
if (dir == GHOST_DIRECTION.DOWN) { }
```

### Comparing Direction Values

```gml
// BEFORE: Compare degree to magic number
if (direction == 0) { }     // RIGHT
if (direction == 90) { }    // UP
if (direction == 180) { }   // LEFT
if (direction == 270) { }   // DOWN

// AFTER: Convert to degree first
if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT)) { }
if (direction == direction_from_cardinal(GHOST_DIRECTION.UP)) { }
if (direction == direction_from_cardinal(GHOST_DIRECTION.LEFT)) { }
if (direction == direction_from_cardinal(GHOST_DIRECTION.DOWN)) { }

// SHORTER: Store conversion result
var target_dir = direction_from_cardinal(GHOST_DIRECTION.UP);
if (direction == target_dir) { }
```

---

## Create_0.gml Conversion

### Before

```gml
/// ===== ANIMATION & VISUAL VARIABLES =====
im = 0;
flash = 0;

// ... 40 lines of variable initialization ...

state = 0;
dir = 2;
```

### After

```gml
/// ===== BLINKY CREATE_0.GML =====
event_inherited();  // Load parent variables first

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

## Step_1.gml Conversion

### Frightened Flash Logic

```gml
// BEFORE
if (Pac.alarm[0] > 120) { flash = 0; }
if (Pac.alarm[0] = 120) { flash = 1; }
if (Pac.alarm[0] = 106) { flash = 0; }
// ... (10+ more conditions)

// AFTER
if (state == GHOST_STATE.FRIGHTENED) {
    var alarm_time = Pac.alarm[0];

    if (alarm_time > 120) {
        flash = 0;
    } else if (alarm_time <= 120 && alarm_time > 106) {
        flash = 1;
    } else if (alarm_time <= 106 && alarm_time > 92) {
        flash = 0;
    }
    // ... etc
}
```

### Pac Pursuit Target

```gml
// BEFORE (no change needed, just comments)
var pac1_tilex = 16 * round(Pac.x / 16);
var pac1_tiley = 16 * round(Pac.y / 16);
var pac2_tilex = 16 * round(Pac.x2 / 16);
var pac2_tiley = 16 * round(Pac.y2 / 16);

var dist_to_pac1 = abs(pac1_tilex - tilex) + abs(pac1_tiley - tiley);
var dist_to_pac2 = abs(pac2_tilex - tilex) + abs(pac2_tiley - tiley);

// Choose closest
if (dist_to_pac1 == dist_to_pac2) {
    pursuex = irandom(1) ? pac2_tilex : pac1_tilex;
    pursuey = irandom(1) ? pac2_tiley : pac1_tiley;
} else if (dist_to_pac2 < dist_to_pac1) {
    pursuex = pac2_tilex;
    pursuey = pac2_tiley;
} else {
    pursuex = pac1_tilex;
    pursuey = pac1_tiley;
}
```

---

## Step_2.gml Conversion

### Speed Selection

```gml
// BEFORE
if (state = 0) {
    if collision_point(tilex, tiley, Slow, false, true) { speed = spslow; }
    else {
        if Pac.dotcount >= elroydots2 { speed = spelroy2; }
        else {
            if Pac.dotcount >= elroydots { speed = spelroy; }
            else { speed = sp; }
        }
    }
}
if (state = 1) {
    if collision_point(tilex, tiley, Slow, false, true) { speed = spslow; }
    else { speed = spfright; }
}
if (state = 2) { speed = speyes; }

// AFTER
if (state == GHOST_STATE.CHASE) {
    if (collision_point(tilex, tiley, Slow, false, true)) {
        speed = spslow;
    } else if (Pac.dotcount >= elroydots2) {
        speed = spelroy2;
    } else if (Pac.dotcount >= elroydots) {
        speed = spelroy;
    } else {
        speed = sp;
    }
} else if (state == GHOST_STATE.FRIGHTENED) {
    if (collision_point(tilex, tiley, Slow, false, true)) {
        speed = spslow;
    } else {
        speed = spfright;
    }
} else if (state == GHOST_STATE.EYES) {
    speed = speyes;
}
```

### Direction Turning

```gml
// BEFORE
if (dir = 0) {
    if direction = 0 and x > tilex { direction = 0; newtile = 0; exit; }
    if direction = 90 and y < tiley { direction = 0; x=tilex+(tiley-y); y=tiley; newtile = 0; exit; }
    // ... (2 more conditions)
}

// AFTER
if (dir == GHOST_DIRECTION.RIGHT) {
    // Turning RIGHT (0°)
    if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT) && x > tilex) {
        direction = direction_from_cardinal(GHOST_DIRECTION.RIGHT);
        newtile = 0;
        exit;
    }
    if (direction == direction_from_cardinal(GHOST_DIRECTION.UP) && y < tiley) {
        direction = direction_from_cardinal(GHOST_DIRECTION.RIGHT);
        x = tilex + (tiley - y);
        y = tiley;
        newtile = 0;
        exit;
    }
    // ... (similar for other directions)
} else if (dir == GHOST_DIRECTION.UP) {
    // Turning UP (90°)
    if (direction == direction_from_cardinal(GHOST_DIRECTION.RIGHT) && x > tilex) {
        direction = direction_from_cardinal(GHOST_DIRECTION.UP);
        y = tiley - (x - tilex);
        x = tilex;
        newtile = 0;
        exit;
    }
    // ... (similar pattern)
} else if (dir == GHOST_DIRECTION.LEFT) {
    // Turning LEFT (180°)
    // ... (similar pattern)
} else if (dir == GHOST_DIRECTION.DOWN) {
    // Turning DOWN (270°)
    // ... (similar pattern)
}
```

---

## Draw_0.gml Conversion

### State-Based Drawing

```gml
// BEFORE
if (state = 0) {
    // Draw normal ghost
    draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
}
if (state = 1) {
    // Draw frightened ghost
    var fright_color = make_color_rgb(flash*255, flash*255, 255);
    draw_sprite_ext(spr_Ghost, frame, x, y, 1, 1, 0, fright_color, 1);
}

// AFTER
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

---

## Other_0.gml Conversion

### Tunnel Wrapping

```gml
// BEFORE
if (direction = 180 and x < -24) {
    x = (room_width + 24) - (x + 24);
    tilex = 16*(round(x/16));
}
if (direction = 0 and x > (room_width + 24)) {
    x = -24 + (x - (room_width + 24));
    tilex = 16*(round(x/16));
}

// AFTER
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

---

## Other_4.gml Conversion

### State Initialization

```gml
// BEFORE
state = 0;
dir = 2;

// AFTER
state = GHOST_STATE.CHASE;
dir = GHOST_DIRECTION.LEFT;
```

---

## Alarm_0.gml Conversion

### Ghost Eaten Response

```gml
// BEFORE
state = 2;
if (state = 1) { ... }

// AFTER
state = GHOST_STATE.EYES;
if (state == GHOST_STATE.FRIGHTENED) { ... }
```

### Direction Reversal

```gml
// BEFORE
if (house = 0 and state < 2) {
    direction = resdir * 90;
}

// AFTER
if (house == 0 && state < GHOST_STATE.EYES) {
    direction = resdir * 90;
}
```

---

## House Logic Conversions

### House State Checks

```gml
// BEFORE
if (house = 0 and state < 2) { }       // Not in house and not eyes
if (state = 2) { }                      // Eyes mode

// AFTER
if (house == 0 && state < GHOST_STATE.EYES) { }  // Not in house and not eyes
if (state == GHOST_STATE.EYES) { }                // Eyes mode
```

---

## Common Patterns

### Checking State

```gml
// In-house check
if (state < GHOST_STATE.EYES) { }       // Chase or Frightened

// Not in house check
if (house == 0) { }

// Eyes returning check
if (state == GHOST_STATE.EYES) { }

// Released to maze check
if (state == GHOST_STATE.CHASE && house == 0) { }
```

### Checking Direction

```gml
// Moving right
if (dir == GHOST_DIRECTION.RIGHT) { }

// Not moving left
if (dir != GHOST_DIRECTION.LEFT) { }

// Moving horizontally
if (dir == GHOST_DIRECTION.RIGHT || dir == GHOST_DIRECTION.LEFT) { }

// Moving vertically
if (dir == GHOST_DIRECTION.UP || dir == GHOST_DIRECTION.DOWN) { }
```

### Direction Math

```gml
// Convert cardinal to degree
var degree = direction_from_cardinal(dir);

// Opposite direction
var opposite = direction_opposite(dir);

// Get name for debug
var dir_name = direction_name(dir);  // "RIGHT", "UP", etc.

// Get movement vector
var vec = direction_to_vector(dir);  // {dx: 1, dy: 0} for RIGHT
```

---

## Testing Enum Values

### Debug Output

```gml
// Test in Create_0.gml or in debug watch:
show_debug_message("State: " + string(state) +
                   " (" + ghost_state_name(state) + ")");

show_debug_message("Direction: " + string(direction) +
                   " Cardinal: " + string(dir) +
                   " (" + direction_name(dir) + ")");
```

### Assert Checks

```gml
// Verify enum values
assert(GHOST_STATE.CHASE == 0);
assert(GHOST_STATE.FRIGHTENED == 1);
assert(GHOST_STATE.EYES == 2);

assert(GHOST_DIRECTION.RIGHT == 0);
assert(GHOST_DIRECTION.UP == 1);
assert(GHOST_DIRECTION.LEFT == 2);
assert(GHOST_DIRECTION.DOWN == 3);

// Verify conversions
assert(direction_from_cardinal(0) == 0);    // RIGHT
assert(direction_from_cardinal(1) == 90);   // UP
assert(direction_from_cardinal(2) == 180);  // LEFT
assert(direction_from_cardinal(3) == 270);  // DOWN
```

---

## Enum Value Reference Chart

| Concept | Old | New | Degree |
|---------|-----|-----|--------|
| **State: Chase** | `state = 0` | `state = GHOST_STATE.CHASE` | N/A |
| **State: Frightened** | `state = 1` | `state = GHOST_STATE.FRIGHTENED` | N/A |
| **State: Eyes** | `state = 2` | `state = GHOST_STATE.EYES` | N/A |
| **Direction: Right** | `dir = 0` | `dir = GHOST_DIRECTION.RIGHT` | 0° |
| **Direction: Up** | `dir = 1` | `dir = GHOST_DIRECTION.UP` | 90° |
| **Direction: Left** | `dir = 2` | `dir = GHOST_DIRECTION.LEFT` | 180° |
| **Direction: Down** | `dir = 3` | `dir = GHOST_DIRECTION.DOWN` | 270° |

---

## Implementation Checklist

- [ ] Replace all `state = 0` with `state = GHOST_STATE.CHASE`
- [ ] Replace all `state = 1` with `state = GHOST_STATE.FRIGHTENED`
- [ ] Replace all `state = 2` with `state = GHOST_STATE.EYES`
- [ ] Replace all `state = 3` with `state = GHOST_STATE.IN_HOUSE`
- [ ] Replace all `state = 4` with `state = GHOST_STATE.HOUSE_READY`
- [ ] Replace all `dir = 0` with `dir = GHOST_DIRECTION.RIGHT`
- [ ] Replace all `dir = 1` with `dir = GHOST_DIRECTION.UP`
- [ ] Replace all `dir = 2` with `dir = GHOST_DIRECTION.LEFT`
- [ ] Replace all `dir = 3` with `dir = GHOST_DIRECTION.DOWN`
- [ ] Replace `if (state == 0)` with `if (state == GHOST_STATE.CHASE)`
- [ ] Replace `if (state == 1)` with `if (state == GHOST_STATE.FRIGHTENED)`
- [ ] Replace `if (state == 2)` with `if (state == GHOST_STATE.EYES)`
- [ ] Replace `if (dir == 0)` with `if (dir == GHOST_DIRECTION.RIGHT)`
- [ ] Replace `if (dir == 1)` with `if (dir == GHOST_DIRECTION.UP)`
- [ ] Replace `if (dir == 2)` with `if (dir == GHOST_DIRECTION.LEFT)`
- [ ] Replace `if (dir == 3)` with `if (dir == GHOST_DIRECTION.DOWN)`
- [ ] Add `direction = direction_from_cardinal(dir)` conversions
- [ ] Update all tunnel wrapping logic
- [ ] Test all state transitions
- [ ] Test all direction movements
- [ ] Compare gameplay with original

---

**This quick reference is for copying/pasting conversion patterns. See BLINKY_CONVERSION_GUIDE.md for complete details.**
