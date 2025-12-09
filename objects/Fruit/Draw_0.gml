/// ===============================================================================
/// FRUIT OBJECT - DRAW EVENT
/// ===============================================================================
/// Purpose: Render fruit sprites, game over/ready text, and debug overlays
/// Called: Every frame during draw event
///
/// Responsibilities:
/// 1. Calculate color values for text rendering (HSV color space)
/// 2. Draw "GAME OVER" and "READY" text overlays
/// 3. Draw fruit sprite with bounce animation
/// 4. Draw fruit collection points display
/// 5. Draw explosion animation when fruit is collected
/// 6. Draw debug overlay (when Pac.test is enabled)
/// ===============================================================================

// ===== COLOR CALCULATION =====
/// Extract hue, saturation, and value from global color variables
/// These are used for dynamic text coloring based on game mode
dh = color_get_hue(make_color_rgb(global.dr, global.dg, global.db));
ds = color_get_saturation(make_color_rgb(global.dr, global.dg, global.db));

/// Set value based on random mode
/// If random mode is off, use actual color value; otherwise use max brightness
if (global.rand == 0) {
    dv = color_get_value(make_color_rgb(global.dr, global.dg, global.db));
} else {
    dv = 255;
}

/// Extract secondary color values for shadow/outline effects
mh2 = color_get_hue(make_color_rgb(global.mr2, global.mg2, global.mb2));
ms2 = color_get_saturation(make_color_rgb(global.mr2, global.mg2, global.mb2));
mv2 = color_get_value(make_color_rgb(global.mr2, global.mg2, global.mb2));

// ===== GAME OVER TEXT DISPLAY =====
/// Display "GAME OVER" text when game ends
/// Only show when game is not paused and game over conditions are met
if (Pauser.pause == 0) {
    draw_set_font(font0);
    draw_set_halign(fa_left);
    
    /// Check if game over conditions are met:
    /// - Player 1 or 2 has 0 lives and game over flag is not set, AND countdown is finished
    /// - OR level is 0 (menu state)
    if (((global.p1lives == 0 && global.p1gameover == 0) || 
         (global.p2lives == 0 && global.p2gameover == 0)) && 
        Pac.countdown == -1) || global.lvl == 0 {
        
        // ===== SMALL ROOM (448 width) =====
        /// Classic Pacman room size
        if (room_width == 448) {
            /// Display current player indicator
            if (global.players > 0) {
                draw_set_color(c_aqua);
                if (global.p2lives > 0 || global.p2gameover == 1) {
                    draw_text((Blinky.xstart - 216) + 144, 
                             (Blinky.ystart - 224) + 224, 
                             string_hash_to_newline("PLAYER ONE"));
                } else {
                    draw_text((Blinky.xstart - 216) + 144, 
                             (Blinky.ystart - 224) + 224, 
                             string_hash_to_newline("PLAYER TWO"));
                }
            }
            
            /// Draw "GAME OVER" text in red
            draw_set_color(c_red);
            draw_text((Blinky.xstart - 216) + 144, 
                     (Blinky.ystart - 224) + 320, 
                     string_hash_to_newline("GAME  OVER"));
        }
        // ===== LARGE ROOM (960 height) =====
        else {
            if (room_height == 960) {
                /// Display player indicator with shadow effect
                if (global.players > 0) {
                    if (global.p2lives > 0 || global.p2gameover == 1) {
                        /// Shadow layer (offset by 2 pixels)
                        draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                        draw_text(Blinky.xstart - 74, Blinky.ystart + 2, 
                                 string_hash_to_newline("PLAYER ONE"));
                        
                        /// Main text layer
                        draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                        draw_text(Blinky.xstart - 72, Blinky.ystart, 
                                 string_hash_to_newline("PLAYER ONE"));
                    } else {
                        /// Shadow layer
                        draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                        draw_text(Blinky.xstart - 74, Blinky.ystart + 2, 
                                 string_hash_to_newline("PLAYER TWO"));
                        
                        /// Main text layer
                        draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                        draw_text(Blinky.xstart - 72, Blinky.ystart, 
                                 string_hash_to_newline("PLAYER TWO"));
                    }
                }
                
                /// Draw "GAME OVER" with shadow effect
                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                draw_text(Blinky.xstart - 74, Blinky.ystart + 98, 
                         string_hash_to_newline("GAME  OVER"));
                
                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                draw_text(Blinky.xstart - 72, Blinky.ystart + 96, 
                         string_hash_to_newline("GAME  OVER"));
            }
            // ===== EXTENDED ROOM (other sizes) =====
            else {
                /// Display player indicator for extended rooms
                if (global.players > 0) {
                    if (global.p2lives > 0 || global.p2gameover == 1) {
                        draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                        draw_text(350 - (c64 * 144), (extend * 16) + 210, 
                                 string_hash_to_newline("PLAYER ONE"));
                        
                        draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                        draw_text(352 - (c64 * 144), (extend * 16) + 208, 
                                 string_hash_to_newline("PLAYER ONE"));
                    } else {
                        draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                        draw_text(350 - (c64 * 144), (extend * 16) + 210, 
                                 string_hash_to_newline("PLAYER TWO"));
                        
                        draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                        draw_text(352 - (c64 * 144), (extend * 16) + 208, 
                                 string_hash_to_newline("PLAYER TWO"));
                    }
                }
                
                /// Draw "GAME OVER" for extended rooms
                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                draw_text(350 - (c64 * 144), (extend * 16) + 306, 
                         string_hash_to_newline("GAME  OVER"));
                
                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                draw_text(352 - (c64 * 144), (extend * 16) + 304, 
                         string_hash_to_newline("GAME  OVER"));
            }
        }
    }
    // ===== READY TEXT DISPLAY =====
    /// Display "READY" text when level is starting
    else {
        if (global.start == 1) {
            // ===== SMALL ROOM (448 width) =====
            if (room_width == 448) {
                /// Only show if alarm[9] is not finished (level start delay)
                if (Pac.alarm[9] != -1) {
                    draw_set_color(c_aqua);
                    
                    /// Display player indicator
                    if (global.players > 0 && global.players < 3 && 
                        global.p1lives > 0 && global.p2lives > 0) {
                        draw_text((Blinky.xstart - 216) + 144, 
                                 (Blinky.ystart - 224) + 224, 
                                 string_hash_to_newline(" PLAYERS  "));
                    } else {
                        if (global.p1lives > 0) {
                            draw_text((Blinky.xstart - 216) + 144, 
                                     (Blinky.ystart - 224) + 224, 
                                     string_hash_to_newline("PLAYER ONE"));
                        } else {
                            draw_text((Blinky.xstart - 216) + 144, 
                                     (Blinky.ystart - 224) + 224, 
                                     string_hash_to_newline("PLAYER TWO"));
                        }
                    }
                }
                
                /// Draw "READY" text in yellow with exclamation mark sprite
                draw_set_color(c_yellow);
                draw_text((Blinky.xstart - 216) + 144, 
                         (Blinky.ystart - 224) + 320, 
                         string_hash_to_newline("  READY   "));
                draw_sprite_ext(spr_Exc, 0, 
                               (Blinky.xstart - 216) + 256, 
                               (Blinky.ystart - 224) + 320, 
                               1, 1, 0, c_yellow, 1);
            }
            // ===== LARGE ROOM (960 height) =====
            else {
                if (room_height == 960) {
                    /// Display player indicator with shadow
                    if (Pac.alarm[9] != -1) {
                        if (global.players > 0 && global.players < 3 && 
                            global.p1lives > 0 && global.p2lives > 0) {
                            draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                            draw_text(Blinky.xstart - 74, Blinky.ystart + 2, 
                                     string_hash_to_newline(" PLAYERS  "));
                            
                            draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                            draw_text(Blinky.xstart - 72, Blinky.ystart, 
                                     string_hash_to_newline(" PLAYERS  "));
                        } else {
                            if (global.p1lives > 0) {
                                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                                draw_text(Blinky.xstart - 74, Blinky.ystart + 2, 
                                         string_hash_to_newline("PLAYER ONE"));
                                
                                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                                draw_text(Blinky.xstart - 72, Blinky.ystart, 
                                         string_hash_to_newline("PLAYER ONE"));
                            } else {
                                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                                draw_text(Blinky.xstart - 74, Blinky.ystart + 2, 
                                         string_hash_to_newline("PLAYER TWO"));
                                
                                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                                draw_text(Blinky.xstart - 72, Blinky.ystart, 
                                         string_hash_to_newline("PLAYER TWO"));
                            }
                        }
                    }
                    
                    /// Draw "READY" with shadow and exclamation mark
                    draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                    draw_text(Blinky.xstart - 74, Blinky.ystart + 98, 
                             string_hash_to_newline("  READY   "));
                    draw_sprite_ext(spr_Exc, 0, 
                                   Blinky.xstart + 38, Blinky.ystart + 98, 
                                   1, 1, 0, 
                                   make_color_hsv(mh2 - (global.plus * 40), ms2, mv2), 1);
                    
                    draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                    draw_text(Blinky.xstart - 72, Blinky.ystart + 96, 
                             string_hash_to_newline("  READY   "));
                    draw_sprite_ext(spr_Exc, 0, 
                                   Blinky.xstart + 40, Blinky.ystart + 96, 
                                   1, 1, 0, 
                                   make_color_hsv(dh - (global.plus * 40), ds, dv), 1);
                }
                // ===== EXTENDED ROOM (other sizes) =====
                else {
                    /// Display player indicator for extended rooms
                    if (Pac.alarm[9] != -1) {
                        if (global.players > 0 && global.players < 3 && 
                            global.p1lives > 0 && global.p2lives > 0) {
                            draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                            draw_text(350 - (c64 * 144), (extend * 16) + 210, 
                                     string_hash_to_newline(" PLAYERS  "));
                            
                            draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                            draw_text(352 - (c64 * 144), (extend * 16) + 208, 
                                     string_hash_to_newline(" PLAYERS  "));
                        } else {
                            if (global.p1lives > 0) {
                                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                                draw_text(350 - (c64 * 144), (extend * 16) + 210, 
                                         string_hash_to_newline("PLAYER ONE"));
                                
                                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                                draw_text(352 - (c64 * 144), (extend * 16) + 208, 
                                         string_hash_to_newline("PLAYER ONE"));
                            } else {
                                draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                                draw_text(350 - (c64 * 144), (extend * 16) + 210, 
                                         string_hash_to_newline("PLAYER TWO"));
                                
                                draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                                draw_text(352 - (c64 * 144), (extend * 16) + 208, 
                                         string_hash_to_newline("PLAYER TWO"));
                            }
                        }
                    }
                    
                    /// Draw "READY" for extended rooms
                    draw_set_color(make_color_hsv(mh2 - (global.plus * 40), ms2, mv2));
                    draw_text(350 - (c64 * 144), (extend * 16) + 306, 
                             string_hash_to_newline("  READY   "));
                    draw_sprite_ext(spr_Exc, 0, 
                                   462 - (c64 * 144), (extend * 16) + 306, 
                                   1, 1, 0, 
                                   make_color_hsv(mh2 - (global.plus * 40), ms2, mv2), 1);
                    
                    draw_set_color(make_color_hsv(dh - (global.plus * 40), ds, dv));
                    draw_text(352 - (c64 * 144), (extend * 16) + 304, 
                             string_hash_to_newline("  READY   "));
                    draw_sprite_ext(spr_Exc, 0, 
                                   464 - (c64 * 144), (extend * 16) + 304, 
                                   1, 1, 0, 
                                   make_color_hsv(dh - (global.plus * 40), ds, dv), 1);
                }
            }
        }
    }
}

// ===== FRUIT SPRITE RENDERING =====
/// Draw fruit sprite only when game is active (not in start state)
if (global.start == 0) {
    /// Check if doki mode is enabled (special sprite variant)
    if (global.doki == 1) {
        /// Draw doki fruit sprite at current position with bounce offset
        draw_sprite(spr_DokiFruit, image_index, x, y + bounce);
        
        /// For wrap-around rooms (576 height), draw additional sprites above/below
        if (room_height == 576) {
            draw_sprite(spr_DokiFruit, image_index, x, y + bounce + 512);
            draw_sprite(spr_DokiFruit, image_index, x, y + bounce - 512);
        }
    } else {
        /// Draw standard fruit sprite
        draw_sprite(spr_Fruit, image_index, x, y + bounce);
        
        /// For wrap-around rooms, draw additional sprites above/below
        if (room_height == 576) {
            draw_sprite(spr_Fruit, image_index, x, y + bounce + 512);
            draw_sprite(spr_Fruit, image_index, x, y + bounce - 512);
        }
    }
    
    // ===== POINTS DISPLAY =====
    /// Show points sprite when fruit is collected
    if (points == 1) {
        /// Choose sprite based on game variant and room size
        if (global.ex1 == 0 && room_width == 448) {
            /// Standard Pacman points sprite (pink tint)
            draw_sprite_ext(spr_FruitPoints, value, 
                           xstart - (8 * (scale - 1)), 
                           ystart - (8 * (scale - 1)), 
                           scale, scale, 0, 
                           make_color_rgb(255, 183, 255), 1);
        } else {
            /// Ms. Pacman points sprite (white)
            draw_sprite_ext(spr_MsPoints, value, 
                           xstart - (8 * (scale - 1)), 
                           ystart - (8 * (scale - 1)), 
                           scale, scale, 0, c_white, 1);
        }
    }
    
    // ===== EXPLOSION ANIMATION =====
    /// Draw explosion sprite when fruit explodes (Ms. Pacman mode)
    if (explosion == 1) {
        /// Animation frame cycles every 4 frames (im/4)
        draw_sprite(spr_explosion, floor(im / 4), expx, expy);
    }
}

// ===== DEBUG OVERLAY =====
/// Display debug information when Pac.test is enabled
/// Shows ghost direction indicators and close point markers
if (Pac.test == 1 && Pauser.pause == 0) {
    draw_set_font(font0);
    draw_set_halign(fa_left);
    
    /// Draw close point markers (green numbers)
    draw_set_color(c_green);
    draw_text(closex, closey, string_hash_to_newline("1"));
    draw_text(close2x, close2y, string_hash_to_newline("2"));
    draw_text(close3x, close3y, string_hash_to_newline("3"));
    draw_text(close4x, close4y, string_hash_to_newline("4"));
    
    /// Draw ghost direction indicators (white text)
    draw_set_color(c_white);
    draw_text(c1x, c1y, string_hash_to_newline(c1dir));
    draw_text(c2x, c2y, string_hash_to_newline(c2dir));
    draw_text(c3x, c3y, string_hash_to_newline(c3dir));
    draw_text(c4x, c4y, string_hash_to_newline(c4dir));
    draw_text(c5x, c5y, string_hash_to_newline(c5dir));
    draw_text(c6x, c6y, string_hash_to_newline(c6dir));
    draw_text(c7x, c7y, string_hash_to_newline(c7dir));
    draw_text(c8x, c8y, string_hash_to_newline(c8dir));
}
