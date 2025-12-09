/// ===============================================================================
/// DOT OBJECT - CREATE EVENT (INITIALIZATION)
/// ===============================================================================
/// Purpose: Initialize dot object variables and calculate color values
/// Called: When dot object is created
///
/// Responsibilities:
/// 1. Initialize animation and state variables
/// 2. Calculate color values for rendering
/// 3. Draw dot sprite with appropriate colors
/// ===============================================================================

// ===== INITIALIZE VARIABLES =====
/// Sprite animation speed (0 = static sprite)
image_speed = 0;

/// Smashed flag: 0=normal, 1=smashed by fruit (Jr. Pacman mode)
smashed = 0;

// ===== COLOR VARIABLES (INITIALIZE TO ZERO) =====
/// Color hue, saturation, value (calculated below)
mh = 0;
ms = 0;
mv = 0;

/// Secondary color values (for shadow effects)
mh2 = 0;
ms2 = 0;
mv2 = 0;

/// Dot color values
dh = 0;
ds = 0;
dv = 0;

// ===== COLOR CALCULATION =====
/// Calculate color values from global RGB variables
/// These are used for dynamic coloring based on game mode

/// Extract hue, saturation, and value from main color
mh = color_get_hue(make_color_rgb(global.mr, global.mg, global.mb));
ms = color_get_saturation(make_color_rgb(global.mr, global.mg, global.mb));

/// Set value based on random mode
/// If random mode is off, use actual color value; otherwise use max brightness
if (global.rand == 0) {
    mv = color_get_value(make_color_rgb(global.mr, global.mg, global.mb));
} else {
    mv = 255;
}

/// Extract secondary color values (for shadow/outline effects)
mh2 = color_get_hue(make_color_rgb(global.mr2, global.mg2, global.mb2));
ms2 = color_get_saturation(make_color_rgb(global.mr2, global.mg2, global.mb2));
mv2 = color_get_value(make_color_rgb(global.mr2, global.mg2, global.mb2));

/// Extract dot color values
dh = color_get_hue(make_color_rgb(global.dr, global.dg, global.db));
ds = color_get_saturation(make_color_rgb(global.dr, global.dg, global.db));

/// Set dot value based on random mode
if (global.rand == 0) {
    dv = color_get_value(make_color_rgb(global.dr, global.dg, global.db));
} else {
    dv = 255;
}

// ===== DRAW DOT SPRITE =====
/// Draw dot sprite with appropriate color based on game state
/// Different colors are used for menu vs. gameplay

// ===== MENU MODE =====
/// Draw dot in menu (no plus mode color adjustment)
if (instance_number(Menu) == 1) {
    if (smashed == 0) {
        /// Normal dot (subimage 0)
        draw_sprite_ext(spr_dot, 0, x, y, 1, 1, 0, 
                       make_color_hsv(dh, ds, dv), 1);
    } else {
        /// Smashed dot (subimages 1 and 2 for layered effect)
        draw_sprite_ext(spr_dot, 1, x, y, 1, 1, 0, 
                       make_color_hsv(mh, ms, mv), 1);
        draw_sprite_ext(spr_dot, 2, x, y, 1, 1, 0, 
                       make_color_hsv(mh2, ms2, mv2), 1);
    }
}

// ===== GAMEPLAY MODE =====
/// Draw dot in gameplay (with plus mode color adjustment)
if (instance_number(Menu) == 0) {
    if (smashed == 0) {
        /// Normal dot with plus mode color shift
        draw_sprite_ext(spr_dot, 0, x, y, 1, 1, 0, 
                       make_color_hsv(dh - (global.plus * 40), ds, dv), 1);
    } else {
        /// Smashed dot with plus mode color shift
        draw_sprite_ext(spr_dot, 1, x, y, 1, 1, 0, 
                       make_color_hsv(mh - (global.plus * 40), ms, mv), 1);
        draw_sprite_ext(spr_dot, 2, x, y, 1, 1, 0, 
                       make_color_hsv(mh2 - (global.plus * 40), ms2, mv2), 1);
    }
}
