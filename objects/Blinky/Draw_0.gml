/// ===== BLINKY DRAW EVENT =====
/// Renders Blinky with different sprites based on game state, special modes, and animations
///
/// Global Variables Used:
/// - global.boost: Speed boost mode (2 = active)
/// - global.game: Game variant (0=normal, 1=?, 2=special mode)
/// - global.plus: Plus/enhancement mode flag
/// - global.otto: Otto Mon mode (enemy variant)

// Only draw if Pac hasn't won (still playing) and Blinky isn't "chomped" (eaten)
if (Pac.alarm[9] == -1 && chomped == 0) {

    /// ===== NORMAL CHASE/SCATTER MODE (state = 0) =====
    if (state == 0) {
        // Draw boost effect lines when speed boost is active
        if (house == 0 && Pac.start == 0 && global.boost == 2 && !collision_point(tilex, tiley, Slow, false, true)) {
            var boost_subimg = dir;
            var boost_y_offset = global.plus * floor(global.game / 2) * 8;

            if (dir == 1) {
                boost_subimg = 5;  // Special up direction
                boost_y_offset = 0;
            } else if (dir == 3) {
                boost_subimg = 6;  // Special down direction
            }

            draw_sprite_ext(spr_boostlines, boost_subimg, x, y + boost_y_offset, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
        }

        // Draw ghost body sprite
        if (global.otto == 0) {
            // Standard Pac-Man ghost
            var anim_frame = floor(im / 8) + floor((global.plus + (global.game / 2)) / 2) * 6;
            var body_color = make_color_rgb(255, 0, 0);  // Red for Blinky

            if (Pac.start == false) {
                // Game is running: animate
                draw_sprite_ext(spr_Ghost, anim_frame, x, y, 1, 1, 0, body_color, 1);
            } else {
                // Game paused/idle: show static frame
                draw_sprite_ext(spr_Ghost, 0 + floor((global.plus + (global.game / 2)) / 2) * 6, x, y, 1, 1, 0, body_color, 1);
            }
        } else {
            // Otto Mon variant
            var otto_frame = floor(im / 8) + (2 * dir);

            if (Pac.start == false) {
                draw_sprite_ext(spr_OttoMon, otto_frame, x, y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                draw_sprite(spr_OttoMon, otto_frame + 8, x, y);
            } else {
                draw_sprite_ext(spr_OttoMon, 4, x, y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                draw_sprite(spr_OttoMon, 4 + 8, x, y);
            }
        }

        // Draw eyes
        if (global.game == 2 && global.plus == true) {
            draw_sprite(spr_Eyes, dir, x, y + 6);
        } else {
            draw_sprite(spr_Eyes, dir, x, y);
        }
    }

    /// ===== FRIGHTENED MODE (state = 1) =====
    if (state == 1) {
        if (global.otto == 1) {
            // Otto Mon frightened sprite
            var otto_fright_frame = 16 + floor(im / 8) + (flash * 2);
            draw_sprite(spr_OttoMon, otto_fright_frame, x, y);
        } else {
            // Standard frightened ghost (blue with eyes, flashing effect)
            var fright_frame = floor(im / 8) + (global.plus * 2) + floor((global.plus + (global.game / 2)) / 2) * 6;
            var fright_color = make_color_rgb(flash * 255, flash * 255, 255);  // Cyan when solid, blue when transparent

            draw_sprite_ext(spr_Ghost, fright_frame, x, y, 1, 1, 0, fright_color, 1);

            if (global.plus == true) {
                // Plus mode overlay
                draw_sprite(spr_Ghost, floor(im / 8) + 4, x, y);
            }

            // Draw eyes over frightened body
            draw_sprite(spr_Eyes, 4 + flash, x, y + (global.plus * 3));
        }
    }

    /// ===== SPECIAL GAME MODE 2 OVERLAY =====
    // Extra sprite layer for game mode 2 special effects
    if (Pac.start == false) {
        if (global.game == 2 && global.plus == 1) {
            if (state == 1) {
                // Frightened mode: magenta/pink tint
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y, 1, 1, 0, make_color_rgb(255, 255 - (flash * 255), 255 - (flash * 255)), 1);
            } else {
                // Normal mode: white overlay
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y, 1, 1, 0, c_white, 1);
            }
        }
    } else {
        // Game paused
        if (global.game == 2 && global.plus == 1) {
            draw_sprite(spr_Ghost, 0 + 10, x, y);
        }
    }
}

/// ===== VERTICAL TILING FOR TALL ROOMS (room_height = 576 = double height) =====
/// For stages with double height, draw Blinky in three vertical positions to create seamless tiling

// Check if room is tall (double height)
if (room_height == 576) {
    // Draw ghost's duplicate 512 pixels above (for wrapping at top)
    if (Pac.alarm[9] == -1 && chomped == 0) {
        var offset_y = -512;

        if (state == 0) {
            if (global.otto == 0) {
                var anim_frame = floor(im / 8) + floor((global.plus + (global.game / 2)) / 2) * 6;
                if (Pac.start == false) {
                    draw_sprite_ext(spr_Ghost, anim_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                } else {
                    draw_sprite_ext(spr_Ghost, 0 + floor((global.plus + (global.game / 2)) / 2) * 6, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                }
            } else {
                var otto_frame = floor(im / 8) + (2 * dir);
                if (Pac.start == false) {
                    draw_sprite_ext(spr_OttoMon, otto_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                    draw_sprite(spr_OttoMon, otto_frame + 8, x, y + offset_y);
                } else {
                    draw_sprite_ext(spr_OttoMon, 4, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                    draw_sprite(spr_OttoMon, 4 + 8, x, y + offset_y);
                }
            }

            if (global.game == 2 && global.plus == true) {
                draw_sprite(spr_Eyes, dir, x, y + offset_y + 6);
            } else {
                draw_sprite(spr_Eyes, dir, x, y + offset_y);
            }
        }

        if (state == 1) {
            if (global.otto == 1) {
                draw_sprite(spr_OttoMon, 16 + floor(im / 8) + (flash * 2), x, y + offset_y);
            } else {
                var fright_frame = floor(im / 8) + (global.plus * 2) + floor((global.plus + (global.game / 2)) / 2) * 6;
                draw_sprite_ext(spr_Ghost, fright_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(flash * 255, flash * 255, 255), 1);
                if (global.plus == true) {
                    draw_sprite(spr_Ghost, floor(im / 8) + 4, x, y + offset_y);
                }
                draw_sprite(spr_Eyes, 4 + flash, x, y + offset_y + (global.plus * 3));
            }
        }

        if (Pac.start == false && global.game == 2 && global.plus == 1) {
            if (state == 1) {
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 255 - (flash * 255), 255 - (flash * 255)), 1);
            } else {
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y + offset_y, 1, 1, 0, c_white, 1);
            }
        } else if (global.game == 2 && global.plus == 1) {
            draw_sprite(spr_Ghost, 0 + 10, x, y + offset_y);
        }
    }

    // Draw ghost's duplicate 512 pixels below (for wrapping at bottom)
    if (Pac.alarm[9] == -1 && chomped == 0) {
        var offset_y = 512;

        if (state == 0) {
            if (global.otto == 0) {
                var anim_frame = floor(im / 8) + floor((global.plus + (global.game / 2)) / 2) * 6;
                if (Pac.start == false) {
                    draw_sprite_ext(spr_Ghost, anim_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                } else {
                    draw_sprite_ext(spr_Ghost, 0 + floor((global.plus + (global.game / 2)) / 2) * 6, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                }
            } else {
                var otto_frame = floor(im / 8) + (2 * dir);
                if (Pac.start == false) {
                    draw_sprite_ext(spr_OttoMon, otto_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                    draw_sprite(spr_OttoMon, otto_frame + 8, x, y + offset_y);
                } else {
                    draw_sprite_ext(spr_OttoMon, 4, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 0, 0), 1);
                    draw_sprite(spr_OttoMon, 4 + 8, x, y + offset_y);
                }
            }

            if (global.game == 2 && global.plus == true) {
                draw_sprite(spr_Eyes, dir, x, y + offset_y + 6);
            } else {
                draw_sprite(spr_Eyes, dir, x, y + offset_y);
            }
        }

        if (state == 1) {
            if (global.otto == 1) {
                draw_sprite(spr_OttoMon, 16 + floor(im / 8) + (flash * 2), x, y + offset_y);
            } else {
                var fright_frame = floor(im / 8) + (global.plus * 2) + floor((global.plus + (global.game / 2)) / 2) * 6;
                draw_sprite_ext(spr_Ghost, fright_frame, x, y + offset_y, 1, 1, 0, make_color_rgb(flash * 255, flash * 255, 255), 1);
                if (global.plus == true) {
                    draw_sprite(spr_Ghost, floor(im / 8) + 4, x, y + offset_y);
                }
                draw_sprite(spr_Eyes, 4 + flash, x, y + offset_y + (global.plus * 3));
            }
        }

        if (Pac.start == false && global.game == 2 && global.plus == 1) {
            if (state == 1) {
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y + offset_y, 1, 1, 0, make_color_rgb(255, 255 - (flash * 255), 255 - (flash * 255)), 1);
            } else {
                draw_sprite_ext(spr_Ghost, floor(im / 8) + 10, x, y + offset_y, 1, 1, 0, c_white, 1);
            }
        } else if (global.game == 2 && global.plus == 1) {
            draw_sprite(spr_Ghost, 0 + 10, x, y + offset_y);
        }
    }
}

